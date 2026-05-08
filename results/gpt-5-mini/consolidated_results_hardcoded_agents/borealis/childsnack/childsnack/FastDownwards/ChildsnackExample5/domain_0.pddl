(define (domain sandwich-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    agent tray sandwich bread_portion content_portion child - object
    location
  )

  (:predicates
    ;; Location of any object (agent, tray, sandwich, child)
    (at ?o - object ?l - location)

    ;; Ingredient availability
    (has_bread ?b - bread_portion)
    (has_content ?c - content_portion)
    (bread_gluten_free ?b - bread_portion)
    (content_gluten_free ?c - content_portion)

    ;; Sandwich bookkeeping
    (exists_sandwich ?s - sandwich)
    (sandwich_has_bread ?s - sandwich ?b - bread_portion)
    (sandwich_has_content ?s - sandwich ?c - content_portion)
    (sandwich_gluten_free ?s - sandwich)

    ;; Tray and placement
    (on_tray ?s - sandwich ?t - tray)
    (tray_free ?t - tray) ;; slot-based capacity: each tray holds at most one sandwich

    ;; Children and serving
    (child_allergic_gluten ?ch - child)
    (served ?ch - child ?s - sandwich)

    ;; Authorization flag used to express the disjunctive safety condition for serve_sandwich
    (can_serve ?ch - child ?s - sandwich)
  )

  ;; make_sandwich_no_gluten: deterministic creation of a gluten-free sandwich
  (:action make_sandwich_no_gluten
    :parameters (?chef - agent ?s - sandwich ?b - bread_portion ?c - content_portion ?k - location)
    :precondition (and
      (at ?chef ?k)
      (has_bread ?b)
      (has_content ?c)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
      (not (exists_sandwich ?s))
    )
    :effect (and
      (exists_sandwich ?s)
      (sandwich_has_bread ?s ?b)
      (sandwich_has_content ?s ?c)
      (sandwich_gluten_free ?s)
      (at ?s ?k)                    ; sandwich created on the kitchen surface
      (not (has_bread ?b))
      (not (has_content ?c))
    )
  )

  ;; make_sandwich: creates a sandwich using specified portions; gluten-free marking handled separately
  (:action make_sandwich
    :parameters (?chef - agent ?s - sandwich ?b - bread_portion ?c - content_portion ?k - location)
    :precondition (and
      (at ?chef ?k)
      (has_bread ?b)
      (has_content ?c)
      (not (exists_sandwich ?s))
    )
    :effect (and
      (exists_sandwich ?s)
      (sandwich_has_bread ?s ?b)
      (sandwich_has_content ?s ?c)
      (at ?s ?k)                    ; sandwich created on the kitchen surface
      (not (has_bread ?b))
      (not (has_content ?c))
    )
  )

  ;; mark_sandwich_gluten_free: a helper to deterministically mark a sandwich as gluten-free when both ingredients are gluten-free
  (:action mark_sandwich_gluten_free
    :parameters (?s - sandwich ?b - bread_portion ?c - content_portion)
    :precondition (and
      (exists_sandwich ?s)
      (sandwich_has_bread ?s ?b)
      (sandwich_has_content ?s ?c)
      (bread_gluten_free ?b)
      (content_gluten_free ?c)
      (not (sandwich_gluten_free ?s))
    )
    :effect (sandwich_gluten_free ?s)
  )

  ;; put_on_tray: requires sandwich and tray co-located; uses tray_free to enforce capacity = 1
  (:action put_on_tray
    :parameters (?chef - agent ?s - sandwich ?t - tray ?loc - location)
    :precondition (and
      (at ?chef ?loc)
      (at ?t ?loc)
      (exists_sandwich ?s)
      (at ?s ?loc)             ; sandwich must be co-located with tray and chef
      (tray_free ?t)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (on_tray ?s ?t)
      (not (at ?s ?loc))       ; sandwich location is now represented implicitly by (on_tray + at tray)
      (not (tray_free ?t))
    )
  )

  ;; move_tray: moves a tray between locations. Sandwiches on the tray remain on_tray and are implicitly located with the tray.
  (:action move_tray
    :parameters (?chef - agent ?t - tray ?from - location ?to - location)
    :precondition (and
      (at ?chef ?from)
      (at ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
      ;; Note: sandwiches that are on_tray remain on_tray; their effective location for serving is (on_tray ?s ?t) combined with (at ?t ?to).
    )
  )

  ;; serve_sandwich_no_gluten: direct serving action that requires an explicitly gluten-free sandwich
  (:action serve_sandwich_no_gluten
    :parameters (?chef - agent ?s - sandwich ?t - tray ?ch - child ?loc - location)
    :precondition (and
      (at ?chef ?loc)
      (at ?t ?loc)
      (on_tray ?s ?t)
      (sandwich_gluten_free ?s)
      (at ?ch ?loc)
      (not (served ?ch ?s))
    )
    :effect (and
      (served ?ch ?s)
      (not (on_tray ?s ?t))
      (not (exists_sandwich ?s))
      (tray_free ?t)
    )
  )

  ;; authorize_serve_non_allergic: establishes can_serve for a (child,sandwich) pair when the child is not allergic
  (:action authorize_serve_non_allergic
    :parameters (?ch - child ?s - sandwich)
    :precondition (not (child_allergic_gluten ?ch))
    :effect (can_serve ?ch ?s)
  )

  ;; authorize_serve_glutenfree: establishes can_serve for a (child,sandwich) pair when the sandwich is gluten-free
  (:action authorize_serve_glutenfree
    :parameters (?ch - child ?s - sandwich)
    :precondition (sandwich_gluten_free ?s)
    :effect (can_serve ?ch ?s)
  )

  ;; serve_sandwich: a single action name that consumes the can_serve authorization (which encodes the disjunctive safety rule).
  (:action serve_sandwich
    :parameters (?chef - agent ?s - sandwich ?t - tray ?ch - child ?loc - location)
    :precondition (and
      (at ?chef ?loc)
      (at ?t ?loc)
      (on_tray ?s ?t)
      (can_serve ?ch ?s)  ;; must be produced beforehand by authorize_serve_non_allergic or authorize_serve_glutenfree
      (at ?ch ?loc)
      (not (served ?ch ?s))
    )
    :effect (and
      (served ?ch ?s)
      (not (on_tray ?s ?t))
      (not (exists_sandwich ?s))
      (tray_free ?t)
    )
  )
)