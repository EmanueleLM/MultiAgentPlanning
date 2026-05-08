(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place table - place
    child
    bread-portion
    content-portion
    sandwich
    tray
  )

  (:predicates
    ;; Locations
    (at-bread ?b - bread-portion ?p - place)
    (at-content ?c - content-portion ?p - place)
    (tray-at ?t - tray ?p - place)
    (sandwich-at ?s - sandwich ?p - place)  ;; sandwich location only used when not on a tray
    (on-tray ?s - sandwich ?t - tray)       ;; sandwich is on a tray

    ;; Existence / availability / usage
    (exists-sandwich ?s - sandwich)
    (bread-available ?b - bread-portion)
    (content-available ?c - content-portion)
    (used-bread ?b - bread-portion)
    (used-content ?c - content-portion)

    ;; Gluten properties
    (gluten-free-bread ?b - bread-portion)
    (gluten-free-content ?c - content-portion)
    (sandwich-gluten-free ?s - sandwich)
    (sandwich-contains-gluten ?s - sandwich)

    ;; Provenance
    (created-from ?s - sandwich ?b - bread-portion ?c - content-portion)

    ;; Children / serving
    (child-at ?ch - child ?p - place)
    (allergic-gluten ?ch - child)
    (served ?ch - child)
  )

  ;; Actions
  (:action make-sandwich-no-gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (at-bread ?b ?p)
      (bread-available ?b)
      (at-content ?c ?p)
      (content-available ?c)
      (gluten-free-bread ?b)
      (gluten-free-content ?c)
      (not (exists-sandwich ?s))
      ;; preparation restricted to kitchen by initial model usage; no explicit type check here,
      ;; the problem initial state places ingredients in kitchen and sandwich will be created there.
    )
    :effect (and
      ;; create sandwich
      (exists-sandwich ?s)
      (sandwich-gluten-free ?s)
      (sandwich-at ?s ?p)
      (created-from ?s ?b ?c)
      ;; consume ingredients
      (used-bread ?b)
      (used-content ?c)
      (not (bread-available ?b))
      (not (content-available ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  (:action make-sandwich-from-non-gf-bread
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (at-bread ?b ?p)
      (bread-available ?b)
      (at-content ?c ?p)
      (content-available ?c)
      (not (gluten-free-bread ?b))
      (not (exists-sandwich ?s))
    )
    :effect (and
      (exists-sandwich ?s)
      (sandwich-contains-gluten ?s)
      (sandwich-at ?s ?p)
      (created-from ?s ?b ?c)
      (used-bread ?b)
      (used-content ?c)
      (not (bread-available ?b))
      (not (content-available ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  (:action make-sandwich-from-non-gf-content
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?p - place)
    :precondition (and
      (at-bread ?b ?p)
      (bread-available ?b)
      (at-content ?c ?p)
      (content-available ?c)
      (not (gluten-free-content ?c))
      (not (exists-sandwich ?s))
    )
    :effect (and
      (exists-sandwich ?s)
      (sandwich-contains-gluten ?s)
      (sandwich-at ?s ?p)
      (created-from ?s ?b ?c)
      (used-bread ?b)
      (used-content ?c)
      (not (bread-available ?b))
      (not (content-available ?c))
      (not (at-bread ?b ?p))
      (not (at-content ?c ?p))
    )
  )

  (:action put-on-tray
    :parameters (?s - sandwich ?t - tray ?p - place)
    :precondition (and
      (exists-sandwich ?s)
      (sandwich-at ?s ?p)
      (tray-at ?t ?p)
    )
    :effect (and
      (on-tray ?s ?t)
      (not (sandwich-at ?s ?p))
    )
  )

  (:action move-tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (tray-at ?t ?from)
      (not (tray-at ?t ?to))  ;; prevents no-op moves; relies on unique tray location invariant
    )
    :effect (and
      (tray-at ?t ?to)
      (not (tray-at ?t ?from))
    )
  )

  (:action serve-sandwich-no-gluten
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (on-tray ?s ?t)
      (tray-at ?t ?p)
      (child-at ?ch ?p)
      (exists-sandwich ?s)
      (sandwich-gluten-free ?s)
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (exists-sandwich ?s))
      (not (sandwich-gluten-free ?s))
      ;; created-from and used-* are bookkeeping about past usage and may remain or be removed.
      ;; Remove created-from to fully consume sandwich object:
      (not (created-from ?s ?b ?c)) ;; this will be harmless if no matching created-from exists (PDDL ignores unmatched deletions)
    )
  )

  (:action serve-sandwich
    :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)
    :precondition (and
      (on-tray ?s ?t)
      (tray-at ?t ?p)
      (child-at ?ch ?p)
      (exists-sandwich ?s)
      (sandwich-contains-gluten ?s)
      (not (allergic-gluten ?ch))
      (not (served ?ch))
    )
    :effect (and
      (served ?ch)
      (not (on-tray ?s ?t))
      (not (exists-sandwich ?s))
      (not (sandwich-contains-gluten ?s))
      (not (created-from ?s ?b ?c)) ;; as above, remove provenance for consumed sandwich
    )
  )

)