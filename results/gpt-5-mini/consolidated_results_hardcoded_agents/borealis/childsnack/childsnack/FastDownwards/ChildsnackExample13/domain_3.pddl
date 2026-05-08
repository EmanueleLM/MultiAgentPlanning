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
    (created ?s - sandwich)                    ;; sandwich placeholder has been turned into a real sandwich (persistent)
    (at_sandwich ?s - sandwich ?p - place)     ;; sandwich is located at a place (kitchen when made)

    ;; sandwich-on-tray marker (prevents double-placement)
    (sandwich_on_tray ?s - sandwich ?t - tray)
    (on_tray ?s - sandwich)                    ;; unary marker: sandwich is on some tray

    ;; attributes and status
    (sandwich_glutenfree ?s - sandwich)

    ;; child status
    (child_allergic ?c - child)   ;; child allergic to gluten
    (served ?c - child)

    ;; discrete global phases (ordered stages) to enforce sequential serving
    (phase_current ?ph - phase)
    (phase_succ ?p1 - phase ?p2 - phase)
  )

  ;; Make a gluten-free sandwich: require unused sandwich placeholder and unused gluten-free ingredients in kitchen.
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

  ;; Make a (possibly gluten-containing) sandwich: require unused sandwich placeholder and unused ingredients in kitchen.
  ;; If both ingredients happen to be gluten-free but this action is used, the sandwich will NOT be marked glutenfree;
  ;; the planner must use make_sandwich_no_gluten when a gluten-free sandwich is required.
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

  ;; Put a sandwich that is at the same place as a tray onto that tray.
  ;; Requires the sandwich not already be on any tray (on_tray) to prevent double placement.
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
      (not (= ?from ?to))
    )
    :effect (and
      (at_tray ?t ?to)
      (not (at_tray ?t ?from))
    )
  )

  ;; Serve a gluten-free sandwich to a child who is allergic: tray and child must be co-located.
  ;; Enforce ordered serving via phase progression: serving consumes the current phase and advances to its successor.
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

  ;; Serve any sandwich to a child who is not allergic (tested with negative precondition).
  ;; Enforce ordered serving via phase progression similarly.
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