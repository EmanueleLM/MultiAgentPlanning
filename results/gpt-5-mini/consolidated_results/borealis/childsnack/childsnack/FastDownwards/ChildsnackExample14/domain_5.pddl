(define (domain child-snack)
  (:requirements :strips :typing :negative-preconditions)
  (:types child bread-portion content-portion sandwich tray place)

  (:constants kitchen - place)

  (:predicates
    ;; resource availability/location
    (at-bread ?b - bread-portion ?p - place)
    (at-content ?c - content-portion ?p - place)
    (bread-gf ?b - bread-portion)
    (content-gf ?c - content-portion)

    ;; sandwich bookkeeping and composition
    (sandwich-slot ?s - sandwich)        ;; unused sandwich slot available to be created
    (sandwich-exists ?s - sandwich)     ;; concrete sandwich exists (created, not yet served)
    (composed-of ?s - sandwich ?b - bread-portion ?c - content-portion)
    (sandwich-gf ?s - sandwich)
    (sandwich-at ?s - sandwich ?p - place) ;; location of sandwich when not on tray

    ;; staging and placement
    (staged-for-tray ?s - sandwich)
    (on-tray ?s - sandwich ?t - tray)
    (on-any-tray ?s - sandwich) ;; true if sandwich currently on some tray

    ;; tray locations
    (tray-at ?t - tray ?p - place)

    ;; children and serving
    (child-waits-at ?c - child ?p - place)
    (child-served ?c - child)
    (allergic-gluten ?c - child)
  )

  ;; ----------------------------
  ;; CHEF: sandwich creation actions
  ;; All creation occurs in the kitchen (no place parameter for creation).
  ;; Components must be at kitchen and are consumed.
  ;; sandwich-slot is consumed and sandwich-exists set; sandwich-at set to kitchen.
  ;; sandwich-gf set only when both components are GF.
  ;; ----------------------------

  ;; both components gluten-free -> produced sandwich is gluten-free
  (:action chef-make-sandwich-gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-slot ?s)
      (not (sandwich-exists ?s))
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (bread-gf ?b)
      (content-gf ?c)
    )
    :effect (and
      (not (sandwich-slot ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-gf ?s)
      (sandwich-at ?s kitchen)
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; bread GF, content NOT GF -> sandwich not GF
  (:action chef-make-sandwich-bread-gf-content-not
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-slot ?s)
      (not (sandwich-exists ?s))
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (bread-gf ?b)
      (not (content-gf ?c))
    )
    :effect (and
      (not (sandwich-slot ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-at ?s kitchen)
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; content GF, bread NOT GF -> sandwich not GF
  (:action chef-make-sandwich-content-gf-bread-not
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-slot ?s)
      (not (sandwich-exists ?s))
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (not (bread-gf ?b))
      (content-gf ?c)
    )
    :effect (and
      (not (sandwich-slot ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-at ?s kitchen)
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; neither component GF -> sandwich not GF
  (:action chef-make-sandwich-none-gf
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (and
      (sandwich-slot ?s)
      (not (sandwich-exists ?s))
      (at-bread ?b kitchen)
      (at-content ?c kitchen)
      (not (bread-gf ?b))
      (not (content-gf ?c))
    )
    :effect (and
      (not (sandwich-slot ?s))
      (sandwich-exists ?s)
      (composed-of ?s ?b ?c)
      (sandwich-at ?s kitchen)
      (not (at-bread ?b kitchen))
      (not (at-content ?c kitchen))
    )
  )

  ;; ----------------------------
  ;; CHEF: staging (explicit place retention) - must be created and located in kitchen to be staged
  ;; ----------------------------
  (:action chef-stage-sandwich-for-tray
    :parameters (?s - sandwich)
    :precondition (and
      (sandwich-exists ?s)
      (sandwich-at ?s kitchen)
      (not (staged-for-tray ?s))
      (not (on-any-tray ?s))
    )
    :effect (and
      (staged-for-tray ?s)
    )
  )

  ;; ----------------------------
  ;; SERVER: put on tray, move tray, serve
  ;; Trays carry sandwiches implicitly via on-tray relation; sandwiches stay associated to the tray through tray moves.
  ;; A sandwich can be on at most one tray at a time, enforced by on-any-tray predicate.
  ;; ----------------------------
  (:action server-put-on-tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (and
      (staged-for-tray ?s)
      (sandwich-at ?s kitchen)
      (tray-at ?t kitchen)
      (not (on-any-tray ?s))
    )
    :effect (and
      (on-tray ?s ?t)
      (on-any-tray ?s)
      (not (staged-for-tray ?s))
      (not (sandwich-at ?s kitchen))
    )
  )

  (:action server-move-tray
    :parameters (?t - tray ?from - place ?to - place)
    :precondition (and
      (tray-at ?t ?from)
      (not (= ?from ?to))
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
      (on-any-tray ?s)
      (sandwich-exists ?s)
      (sandwich-gf ?s)
    )
    :effect (and
      (child-served ?c)
      (not (on-tray ?s ?t))
      (not (on-any-tray ?s))
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
      (on-any-tray ?s)
      (sandwich-exists ?s)
    )
    :effect (and
      (child-served ?c)
      (not (on-tray ?s ?t))
      (not (on-any-tray ?s))
      (not (sandwich-exists ?s))
    )
  )
)