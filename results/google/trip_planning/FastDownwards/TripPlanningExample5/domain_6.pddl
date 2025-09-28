(define (domain trip-planning-adapted)
  (:requirements :typing :adl :negative-preconditions)
  (:types city day)
  (:predicates
    (assigned ?d - day)
    (in ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (can-fly ?c1 - city ?c2 - city)

    (oslo-count-0)
    (oslo-count-1)
    (oslo-count-2)
    (oslo-count-3)
    (oslo-count-4)
    (oslo-count-5)
    (oslo-count-6)

    (porto-count-0)
    (porto-count-1)
    (porto-count-2)
    (porto-count-3)
    (porto-count-4)
    (porto-count-5)
    (porto-count-6)
    (porto-count-7)

    (dubrovnik-count-0)
    (dubrovnik-count-1)
    (dubrovnik-count-2)
    (dubrovnik-count-3)
    (dubrovnik-count-4)
    (dubrovnik-count-5)
  )

  ;; Oslo assignments increments
  (:action assign-oslo-from-0-start
    :parameters (?d - day)
    :precondition (and (oslo-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-0)) (oslo-count-1))
  )
  (:action assign-oslo-from-0-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev oslo) (oslo-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-0)) (oslo-count-1))
  )
  (:action assign-oslo-from-0-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in oslo ?dprev) (oslo-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-0)) (oslo-count-1))
  )

  (:action assign-oslo-from-1-start
    :parameters (?d - day)
    :precondition (and (oslo-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-1)) (oslo-count-2))
  )
  (:action assign-oslo-from-1-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev oslo) (oslo-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-1)) (oslo-count-2))
  )
  (:action assign-oslo-from-1-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in oslo ?dprev) (oslo-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-1)) (oslo-count-2))
  )

  (:action assign-oslo-from-2-start
    :parameters (?d - day)
    :precondition (and (oslo-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-2)) (oslo-count-3))
  )
  (:action assign-oslo-from-2-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev oslo) (oslo-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-2)) (oslo-count-3))
  )
  (:action assign-oslo-from-2-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in oslo ?dprev) (oslo-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-2)) (oslo-count-3))
  )

  (:action assign-oslo-from-3-start
    :parameters (?d - day)
    :precondition (and (oslo-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-3)) (oslo-count-4))
  )
  (:action assign-oslo-from-3-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev oslo) (oslo-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-3)) (oslo-count-4))
  )
  (:action assign-oslo-from-3-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in oslo ?dprev) (oslo-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-3)) (oslo-count-4))
  )

  (:action assign-oslo-from-4-start
    :parameters (?d - day)
    :precondition (and (oslo-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-4)) (oslo-count-5))
  )
  (:action assign-oslo-from-4-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev oslo) (oslo-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-4)) (oslo-count-5))
  )
  (:action assign-oslo-from-4-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in oslo ?dprev) (oslo-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-4)) (oslo-count-5))
  )

  (:action assign-oslo-from-5-start
    :parameters (?d - day)
    :precondition (and (oslo-count-5) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-5)) (oslo-count-6))
  )
  (:action assign-oslo-from-5-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev oslo) (oslo-count-5) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-5)) (oslo-count-6))
  )
  (:action assign-oslo-from-5-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in oslo ?dprev) (oslo-count-5) (not (assigned ?d)))
    :effect (and (assigned ?d) (in oslo ?d) (not (oslo-count-5)) (oslo-count-6))
  )

  ;; Porto assignments increments
  (:action assign-porto-from-0-start
    :parameters (?d - day)
    :precondition (and (porto-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-0)) (porto-count-1))
  )
  (:action assign-porto-from-0-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-0)) (porto-count-1))
  )
  (:action assign-porto-from-0-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-0)) (porto-count-1))
  )

  (:action assign-porto-from-1-start
    :parameters (?d - day)
    :precondition (and (porto-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-1)) (porto-count-2))
  )
  (:action assign-porto-from-1-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-1)) (porto-count-2))
  )
  (:action assign-porto-from-1-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-1)) (porto-count-2))
  )

  (:action assign-porto-from-2-start
    :parameters (?d - day)
    :precondition (and (porto-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-2)) (porto-count-3))
  )
  (:action assign-porto-from-2-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-2)) (porto-count-3))
  )
  (:action assign-porto-from-2-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-2)) (porto-count-3))
  )

  (:action assign-porto-from-3-start
    :parameters (?d - day)
    :precondition (and (porto-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-3)) (porto-count-4))
  )
  (:action assign-porto-from-3-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-3)) (porto-count-4))
  )
  (:action assign-porto-from-3-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-3)) (porto-count-4))
  )

  (:action assign-porto-from-4-start
    :parameters (?d - day)
    :precondition (and (porto-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-4)) (porto-count-5))
  )
  (:action assign-porto-from-4-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-4)) (porto-count-5))
  )
  (:action assign-porto-from-4-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-4)) (porto-count-5))
  )

  (:action assign-porto-from-5-start
    :parameters (?d - day)
    :precondition (and (porto-count-5) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-5)) (porto-count-6))
  )
  (:action assign-porto-from-5-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-5) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-5)) (porto-count-6))
  )
  (:action assign-porto-from-5-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-5) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-5)) (porto-count-6))
  )

  (:action assign-porto-from-6-start
    :parameters (?d - day)
    :precondition (and (porto-count-6) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-6)) (porto-count-7))
  )
  (:action assign-porto-from-6-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev porto) (porto-count-6) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-6)) (porto-count-7))
  )
  (:action assign-porto-from-6-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in porto ?dprev) (porto-count-6) (not (assigned ?d)))
    :effect (and (assigned ?d) (in porto ?d) (not (porto-count-6)) (porto-count-7))
  )

  ;; Dubrovnik assignments increments
  (:action assign-dubrovnik-from-0-start
    :parameters (?d - day)
    :precondition (and (dubrovnik-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-0)) (dubrovnik-count-1))
  )
  (:action assign-dubrovnik-from-0-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev dubrovnik) (dubrovnik-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-0)) (dubrovnik-count-1))
  )
  (:action assign-dubrovnik-from-0-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in dubrovnik ?dprev) (dubrovnik-count-0) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-0)) (dubrovnik-count-1))
  )

  (:action assign-dubrovnik-from-1-start
    :parameters (?d - day)
    :precondition (and (dubrovnik-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-1)) (dubrovnik-count-2))
  )
  (:action assign-dubrovnik-from-1-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev dubrovnik) (dubrovnik-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-1)) (dubrovnik-count-2))
  )
  (:action assign-dubrovnik-from-1-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in dubrovnik ?dprev) (dubrovnik-count-1) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-1)) (dubrovnik-count-2))
  )

  (:action assign-dubrovnik-from-2-start
    :parameters (?d - day)
    :precondition (and (dubrovnik-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-2)) (dubrovnik-count-3))
  )
  (:action assign-dubrovnik-from-2-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev dubrovnik) (dubrovnik-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-2)) (dubrovnik-count-3))
  )
  (:action assign-dubrovnik-from-2-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in dubrovnik ?dprev) (dubrovnik-count-2) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-2)) (dubrovnik-count-3))
  )

  (:action assign-dubrovnik-from-3-start
    :parameters (?d - day)
    :precondition (and (dubrovnik-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-3)) (dubrovnik-count-4))
  )
  (:action assign-dubrovnik-from-3-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev dubrovnik) (dubrovnik-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-3)) (dubrovnik-count-4))
  )
  (:action assign-dubrovnik-from-3-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in dubrovnik ?dprev) (dubrovnik-count-3) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-3)) (dubrovnik-count-4))
  )

  (:action assign-dubrovnik-from-4-start
    :parameters (?d - day)
    :precondition (and (dubrovnik-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-4)) (dubrovnik-count-5))
  )
  (:action assign-dubrovnik-from-4-travel
    :parameters (?dprev - day ?d - day ?cprev - city)
    :precondition (and (next ?dprev ?d) (in ?cprev ?dprev) (can-fly ?cprev dubrovnik) (dubrovnik-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-4)) (dubrovnik-count-5))
  )
  (:action assign-dubrovnik-from-4-stay
    :parameters (?dprev - day ?d - day)
    :precondition (and (next ?dprev ?d) (in dubrovnik ?dprev) (dubrovnik-count-4) (not (assigned ?d)))
    :effect (and (assigned ?d) (in dubrovnik ?d) (not (dubrovnik-count-4)) (dubrovnik-count-5))
  )
)