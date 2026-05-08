(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    ;; resource availability and location
    (available-bread ?b - bread-portion)
    (available-content ?c - content-portion)
    (at-bread ?b - bread-portion ?p - place)
    (at-content ?c - content-portion ?p - place)
    (bread-gf ?b - bread-portion)
    (content-gf ?c - content-portion)

    ;; sandwich bookkeeping
    (sandwich-slot-free ?s - sandwich)
    (sandwich-exists ?s - sandwich)
    (composed-of ?s - sandwich ?b - bread-portion ?c - content-portion)
    (sandwich-gf ?s - sandwich)
    (sandwich-at ?s - sandwich ?p - place)

    ;; staging and placement
    (staged-for-tray ?s - sandwich)
    (on-tray ?s - sandwich ?t - tray)

    ;; tray locations
    (tray-at ?t - tray ?p - place)

    ;; children and serving
    (child-waits-at ?c - child ?p - place)
    (child-served ?c - child)
    (allergic-gluten ?c - child)
  )

  ;; ----------------------------
  ;; CHEF: sandwich creation actions
  ;; Consumption of bread/content is explicit; sandwich slot used and sandwich is placed at the place of components
  ;; ----------------------------

  ;; 1) Both components gluten-free -> produced sandwich is gluten-free
  (:action chef-make-sandwich-gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (bread-gf ?b)
      (content-gf ?c)
      (at-bread ?b ?p)
      (at-content ?c ?p)
    )
    :effect (and
      (not (sandwich-slot-free ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-gf ?s)
      (sandwich-at ?s ?p)
      (not (available-bread ?b))
      (not (available-content ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  ;; 2) Bread GF, content NOT GF -> sandwich not GF
  (:action chef-make-sandwich-bread-gf-content-not
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (bread-gf ?b)
      (not (content-gf ?c))
      (at-bread ?b ?p)
      (at-content ?c ?p)
    )
    :effect (and
      (not (sandwich-slot-free ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-at ?s ?p)
      (not (available-bread ?b))
      (not (available-content ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  ;; 3) Content GF, bread NOT GF -> sandwich not GF
  (:action chef-make-sandwich-content-gf-bread-not
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (not (bread-gf ?b))
      (content-gf ?c)
      (at-bread ?b ?p)
      (at-content ?c ?p)
    )
    :effect (and
      (not (sandwich-slot-free ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-at ?s ?p)
      (not (available-bread ?b))
      (not (available-content ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  ;; 4) Neither component GF -> sandwich not GF
  (:action chef-make-sandwich-none-gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (sandwich-slot-free ?s)
      (available-bread ?b)
      (available-content ?c)
      (not (bread-gf ?b))
      (not (content-gf ?c))
      (at-bread ?b ?p)
      (at-content ?c ?p)
    )
    :effect (and
      (not (sandwich-slot-free ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-at ?s ?p)
      (not (available-bread ?b))
      (not (available-content ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  ;; ----------------------------
  ;; CHEF: staging (explicit place retention)
  ;; ----------------------------
  (:action chef-stage-sandwich-for-tray
    :parameters (?s - sandwich ?p - place)
    :precondition (and
      (sandwich-exists ?s)
      (sandwich-at ?s ?p)
      (not (staged-for-tray ?s))
    )
    :effect (and
      (staged-for-tray ?s)
    )
  )

  ;; ----------------------------
  ;; SERVER: put on tray, move tray, serve
  ;; ----------------------------

  (:action server-put-on-tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (staged-for-tray ?s)
      (sandwich-at ?s ?p)
      (tray-at ?t ?p)
      (not (on-tray ?s ?t))
    )
    :effect (and
      (on-tray ?s ?t)
      (not (staged-for-tray ?s))
      (not (sandwich-at ?s ?p))
    )
  )

  (:action server-move-tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (tray-at ?t ?from)
    )
    :effect (and
      (not (tray-at ?t ?from))
      (tray-at ?t ?to)
    )
  )

  ;; Serve gluten-free sandwich to allergic child
  (:action server-serve-sandwich-no-gluten
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (child-waits-at ?c ?p)
      (not (child-served ?c))
      (allergic-gluten ?c)
      (tray-at ?t ?p)
      (on-tray ?s ?t)
      (sandwich-exists ?s)
      (sandwich-gf ?s)
    )
    :effect (and
      (child-served ?c)
      (not (on-tray ?s ?t))
      (not (sandwich-exists ?s))
    )
  )

  ;; Serve any sandwich to non-allergic child
  (:action server-serve-sandwich
    :parameters (?s - sandwich ?t - tray ?c - child ?p - place)
    :precondition (and
      (child-waits-at ?c ?p)
      (not (child-served ?c))
      (not (allergic-gluten ?c))
      (tray-at ?t ?p)
      (on-tray ?s ?t)
      (sandwich-exists ?s)
    )
    :effect (and
      (child-served ?c)
      (not (on-tray ?s ?t))
      (not (sandwich-exists ?s))
    )
  )
)