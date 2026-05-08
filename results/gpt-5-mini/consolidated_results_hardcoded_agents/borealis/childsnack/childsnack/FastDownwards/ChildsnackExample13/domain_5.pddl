(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place phase)

  (:constants
    kitchen - place
  )

  (:predicates
    ;; tray and people locations
    (at_tray ?t - tray ?p - place)
    (waiting ?c - child ?p - place)

    ;; ingredient availability in kitchen
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)

    ;; gluten annotations on ingredient portions
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)

    ;; sandwich creation and location
    (created ?s - sandwich)
    (at_sandwich ?s - sandwich ?p - place)

    ;; sandwich-on-tray marker and unary marker to prevent double-placement
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (on_tray ?s - sandwich)

    ;; attributes and status
    (sandwich_glutenfree ?s - sandwich)

    ;; child status
    (child_allergic ?c - child)
    (served ?c - child)

    ;; discrete global phases (ordered stages)
    (phase_current ?ph - phase)
    (phase_succ ?p1 - phase ?p2 - phase)
  )

  ;; Make a gluten-free sandwich: requires unused sandwich placeholder and gluten-free bread+content in kitchen.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (created ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
      (no_gluten_bread ?b)
      (no_gluten_content ?c)
    )
    :effect (and
      (created ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_sandwich ?s kitchen)
      (sandwich_glutenfree ?s)
    )
  )

  ;; Make a (possibly gluten-containing) sandwich: requires unused sandwich placeholder and available ingredients in kitchen.
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (created ?s))
      (at_kitchen_bread ?b)
      (at_kitchen_content ?c)
    )
    :effect (and
      (created ?s)
      (not (at_kitchen_bread ?b))
      (not (at_kitchen_content ?c))
      (at_sandwich ?s kitchen)
    )
  )

  ;; Put a sandwich located at the same place as a tray onto that tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (at_sandwich ?s ?p)
      (at_tray ?t ?p)
      (not (on_tray ?s))
    )
    :effect (and
      (sandwich_on_tray ?s ?t)
      (on_tray ?s)
      (not (at_sandwich ?s ?p))
    )
  )

  ;; Move a tray from one place to another.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child who is allergic: tray and child must be co-located and sandwich must be gluten-free.
  ;; Consume the current phase and advance to the successor phase to enforce ordered serving.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place ?ph - phase ?next - phase)
    :precondition (and
      (child_allergic ?c)
      (not (served ?c))
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
      (sandwich_glutenfree ?s)
      (phase_current ?ph)
      (phase_succ ?ph ?next)
    )
    :effect (and
      (served ?c)
      (not (sandwich_on_tray ?s ?t))
      (not (on_tray ?s))
      (not (phase_current ?ph))
      (phase_current ?next)
    )
  )

  ;; Serve any sandwich to a child who is not allergic.
  ;; Consume the current phase and advance to the successor phase to enforce ordered serving.
  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place ?ph - phase ?next - phase)
    :precondition (and
      (not (child_allergic ?c))
      (not (served ?c))
      (sandwich_on_tray ?s ?t)
      (at_tray ?t ?p)
      (waiting ?c ?p)
      (phase_current ?ph)
      (phase_succ ?ph ?next)
    )
    :effect (and
      (served ?c)
      (not (sandwich_on_tray ?s ?t))
      (not (on_tray ?s))
      (not (phase_current ?ph))
      (phase_current ?next)
    )
  )
)