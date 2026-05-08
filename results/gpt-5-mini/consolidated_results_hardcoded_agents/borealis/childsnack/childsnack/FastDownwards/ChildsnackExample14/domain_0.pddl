(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent tray sandwich bread content place child)

  (:predicates
    ;; resources and components
    (available-bread ?b - bread)
    (available-content ?c - content)
    (consumed-bread ?b - bread)
    (consumed-content ?c - content)
    (bread-gf ?b - bread)
    (content-gf ?c - content)

    ;; sandwich identity and composition
    (sandwich-slot-free ?s - sandwich)
    (sandwich-exists ?s - sandwich)
    (composed-of ?s - sandwich ?b - bread ?c - content)
    (sandwich-gf ?s - sandwich)
    (sandwich-not-gf ?s - sandwich)
    (consumed-sandwich ?s - sandwich)

    ;; staging and placement
    (staged-for-tray ?s - sandwich)
    (on-tray ?s - sandwich ?t - tray)

    ;; locations
    (tray-at ?t - tray ?p - place)
    (at-bread ?b - bread ?p - place)
    (at-content ?c - content ?p - place)
    (at-sandwich ?s - sandwich ?p - place)
    (at-agent ?a - agent ?p - place)

    ;; children and serving bookkeeping
    (child-waits-at ?c - child ?p - place)
    (child-served ?c - child)
    (allergic-to-gluten ?c - child)
    (has-served-with ?c - child ?s - sandwich)
  )

  ;; ----------------------------
  ;; ACTIONS FOR THE CHEF (creation & staging)
  ;; ----------------------------

  ;; Make sandwich where both components are gluten-free.
  (:action make-gluten-free-sandwich
    :parameters (?s - sandwich ?b - bread ?c - content ?p - place ?chef - agent)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (bread-gf ?b)
      (content-gf ?c)
      (at-bread ?b ?p)
      (at-content ?c ?p)
      (at-agent ?chef ?p)
    )
    :effect (and
      ;; create sandwich
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-gf ?s)
      ;; assign sandwich location at creation
      (at-sandwich ?s ?p)
      ;; consume resources
      (not (sandwich-slot-free ?s))
      (not (available-bread ?b))
      (not (available-content ?c))
      (consumed-bread ?b)
      (consumed-content ?c)
    )
  )

  ;; Make sandwich where bread is NOT gluten-free (covers cases where bread contains gluten)
  (:action make-non-gf-sandwich-bread-not-gf
    :parameters (?s - sandwich ?b - bread ?c - content ?p - place ?chef - agent)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (not (bread-gf ?b))
      (at-bread ?b ?p)
      (at-content ?c ?p)
      (at-agent ?chef ?p)
    )
    :effect (and
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-not-gf ?s)
      (at-sandwich ?s ?p)
      (not (sandwich-slot-free ?s))
      (not (available-bread ?b))
      (not (available-content ?c))
      (consumed-bread ?b)
      (consumed-content ?c)
    )
  )

  ;; Make sandwich where bread is gluten-free but content is NOT gluten-free
  (:action make-non-gf-sandwich-content-not-gf
    :parameters (?s - sandwich ?b - bread ?c - content ?p - place ?chef - agent)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (bread-gf ?b)
      (not (content-gf ?c))
      (at-bread ?b ?p)
      (at-content ?c ?p)
      (at-agent ?chef ?p)
    )
    :effect (and
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-not-gf ?s)
      (at-sandwich ?s ?p)
      (not (sandwich-slot-free ?s))
      (not (available-bread ?b))
      (not (available-content ?c))
      (consumed-bread ?b)
      (consumed-content ?c)
    )
  )

  ;; Stage sandwich for transfer to tray (chef operation)
  (:action stage-sandwich-for-tray
    :parameters (?s - sandwich ?p - place ?chef - agent)
    :precondition (and
      (sandwich-exists ?s)
      (at-sandwich ?s ?p)
      (not (staged-for-tray ?s))
      (at-agent ?chef ?p)
    )
    :effect (and
      (staged-for-tray ?s)
    )
  )

  ;; ----------------------------
  ;; ACTIONS FOR THE SERVER (tray ops & serving)
  ;; ----------------------------

  ;; Put a staged sandwich onto a tray (server action). Trays have unbounded capacity per specification.
  (:action put-on-tray
    :parameters (?srv - agent ?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (at-agent ?srv ?p)
      (tray-at ?t ?p)
      (sandwich-exists ?s)
      (staged-for-tray ?s)
      (at-sandwich ?s ?p)
      (not (on-tray ?s ?t))
    )
    :effect (and
      (on-tray ?s ?t)
      ;; remove staging and the explicit location (location now tied to tray location)
      (not (staged-for-tray ?s))
      (not (at-sandwich ?s ?p))
    )
  )

  ;; Move a tray from one place to another. Server moves with the tray.
  ;; Note: Sandwich locations while on tray are determined by (on-tray ?s ?t) and (tray-at ?t ?p).
  (:action move-tray
    :parameters (?srv - agent ?t - tray ?from - place ?to - place)
    :precondition (and
      (at-agent ?srv ?from)
      (tray-at ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (tray-at ?t ?from))
      (tray-at ?t ?to)
      (not (at-agent ?srv ?from))
      (at-agent ?srv ?to)
    )
  )

  ;; Serve a gluten-free sandwich to an allergic child (server action).
  (:action serve-sandwich-no-gluten
    :parameters (?srv - agent ?s - sandwich ?t - tray ?child - child ?p - place)
    :precondition (and
      (at-agent ?srv ?p)
      (child-waits-at ?child ?p)
      (not (child-served ?child))
      (allergic-to-gluten ?child)
      (tray-at ?t ?p)
      (on-tray ?s ?t)
      (sandwich-exists ?s)
      (sandwich-gf ?s)
      (not (consumed-sandwich ?s))
    )
    :effect (and
      (child-served ?child)
      (has-served-with ?child ?s)
      (not (on-tray ?s ?t))
      (consumed-sandwich ?s)
      (not (sandwich-exists ?s))
    )
  )

  ;; Serve any sandwich to a non-allergic child (server action).
  (:action serve-sandwich
    :parameters (?srv - agent ?s - sandwich ?t - tray ?child - child ?p - place)
    :precondition (and
      (at-agent ?srv ?p)
      (child-waits-at ?child ?p)
      (not (child-served ?child))
      (not (allergic-to-gluten ?child))
      (tray-at ?t ?p)
      (on-tray ?s ?t)
      (sandwich-exists ?s)
      (not (consumed-sandwich ?s))
    )
    :effect (and
      (child-served ?child)
      (has-served-with ?child ?s)
      (not (on-tray ?s ?t))
      (consumed-sandwich ?s)
      (not (sandwich-exists ?s))
    )
  )
)