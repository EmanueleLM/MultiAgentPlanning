(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    child
    bread-portion
    content-portion
    sandwich
    tray
    place
  )

  (:constants
    kitchen - place
  )

  (:predicates
    ;; Locations
    (at_tray ?t - tray ?l - place)
    (at_bread ?b - bread-portion ?l - place)
    (at_content ?c - content-portion ?l - place)
    (at_sandwich ?s - sandwich ?l - place)
    (waiting ?ch - child ?l - place)

    ;; Allergies and ingredient annotations
    (child_allergic ?ch - child)
    (gluten_free_bread ?b - bread-portion)
    (gluten_free_content ?c - content-portion)

    ;; Sandwich lifecycle
    (sandwich_gf ?s - sandwich)        ;; sandwich explicitly gluten-free
    (sandwich_created ?s - sandwich)   ;; sandwich exists (created)
    (sandwich_consumed ?s - sandwich)  ;; sandwich has been served/consumed

    ;; Tray contents and serving bookkeeping
    (on_tray ?s - sandwich ?t - tray)  ;; sandwich placed on tray
    (served ?ch - child)               ;; child has been served
    (served_with ?ch - child ?s - sandwich) ;; child served with a particular sandwich
  )

  ;; Make a gluten-free sandwich: both chosen bread and content must be marked gluten-free.
  ;; Consumes both ingredient portions and produces a created sandwich located in kitchen, marked GF.
  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_created ?s))
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (gluten_free_bread ?b)
      (gluten_free_content ?c)
    )
    :effect (and
      ;; consume ingredients
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      ;; create sandwich at kitchen and mark gluten-free
      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      (sandwich_gf ?s)
    )
  )

  ;; Make a sandwich when the bread is not gluten-free (content may be GF or not). This produces a non-GF sandwich.
  (:action make_sandwich_non_gf_bread_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_created ?s))
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gluten_free_bread ?b))
    )
    :effect (and
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      ;; sandwich_gf not added -> not gluten-free
    )
  )

  ;; Make a sandwich when the content is not gluten-free (bread may be GF or not). This produces a non-GF sandwich.
  (:action make_sandwich_non_gf_content_not_gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (not (sandwich_created ?s))
      (at_bread ?b kitchen)
      (at_content ?c kitchen)
      (not (gluten_free_content ?c))
    )
    :effect (and
      (not (at_bread ?b kitchen))
      (not (at_content ?c kitchen))

      (sandwich_created ?s)
      (at_sandwich ?s kitchen)
      ;; sandwich_gf not added -> not gluten-free
    )
  )

  ;; Put a created sandwich onto a tray at the same place.
  ;; This requires the sandwich to be present at the place and the tray to be at that place.
  ;; After the action, the sandwich is no longer recorded at the place but is on the tray.
  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray ?loc - place)
    :precondition (and
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (at_sandwich ?s ?loc)
      (at_tray ?t ?loc)
      (not (on_tray ?s ?t))
    )
    :effect (and
      (not (at_sandwich ?s ?loc))
      (on_tray ?s ?t)
    )
  )

  ;; Move a tray from one place to another. This is exclusive: tray cannot be at two places at once.
  (:action move_tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (at_tray ?t ?from)
    )
    :effect (and
      (not (at_tray ?t ?from))
      (at_tray ?t ?to)
    )
  )

  ;; Serve an allergic child: requires child is allergic, waiting at the place, tray at that place,
  ;; sandwich on that tray, sandwich explicitly gluten-free and not already consumed; result marks child served and sandwich consumed.
  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (child_allergic ?ch)
      (at_tray ?t ?p)
      (on_tray ?s ?t)
      (sandwich_gf ?s)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (on_tray ?s ?t))
    )
  )

  ;; Serve a non-allergic child: child must not be marked allergic (negated precondition),
  ;; tray and sandwich collocated, sandwich created and not consumed.
  (:action serve_sandwich
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (waiting ?ch ?p)
      (not (child_allergic ?ch))
      (at_tray ?t ?p)
      (on_tray ?s ?t)
      (sandwich_created ?s)
      (not (sandwich_consumed ?s))
      (not (served ?ch))
    )
    :effect (and
      (sandwich_consumed ?s)
      (served_with ?ch ?s)
      (served ?ch)

      (not (on_tray ?s ?t))
    )
  )
)