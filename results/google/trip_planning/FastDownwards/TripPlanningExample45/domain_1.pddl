(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :equality :action-costs)
  (:types city day dist token)
  (:predicates
    (at ?c - city ?d - day)
    (unassigned ?d - day)
    (next ?d ?nd - day)
    (direct ?c1 ?c2 - city)
    (token-for ?t - token ?c - city)
    (available ?t - token)
    (selected ?dist - dist)
    (choice-made)
  )

  (:action assign-stay
    :parameters (?c - city ?d - day ?nd - day ?t - token)
    :precondition (and (at ?c ?d) (next ?d ?nd) (unassigned ?nd) (direct ?c ?c) (token-for ?t ?c) (available ?t))
    :effect (and (not (unassigned ?nd)) (at ?c ?nd) (not (available ?t)))
    :cost 0
  )

  (:action assign-flight
    :parameters (?cfrom - city ?cto - city ?d - day ?nd - day ?t - token)
    :precondition (and (at ?cfrom ?d) (next ?d ?nd) (unassigned ?nd) (direct ?cfrom ?cto) (not (= ?cfrom ?cto)) (token-for ?t ?cto) (available ?t))
    :effect (and (not (unassigned ?nd)) (at ?cto ?nd) (not (available ?t)))
    :cost 1
  )

  (:action select-dist1
    :parameters ()
    :precondition (not (choice-made))
    :effect (and (choice-made) (selected dist1)
      (available lis1) (available lis2) (available lis3) (available lis4) (available lis5) (available lis6) (available lis7)
      (available flor1) (available flor2)
      (available cop1) (available cop2) (available cop3) (available cop4) (available cop5) (available cop6)
    )
    :cost 0
  )

  (:action select-dist2
    :parameters ()
    :precondition (not (choice-made))
    :effect (and (choice-made) (selected dist2)
      (available lis1) (available lis2) (available lis3) (available lis4) (available lis5) (available lis6) (available lis7)
      (available flor1) (available flor2) (available flor3)
      (available cop1) (available cop2) (available cop3) (available cop4) (available cop5)
    )
    :cost 0
  )

  (:action select-dist3
    :parameters ()
    :precondition (not (choice-made))
    :effect (and (choice-made) (selected dist3)
      (available lis1) (available lis2) (available lis3) (available lis4) (available lis5) (available lis6) (available lis7)
      (available flor1) (available flor2) (available flor3) (available flor4)
      (available cop1) (available cop2) (available cop3) (available cop4)
    )
    :cost 0
  )

  (:action select-dist4
    :parameters ()
    :precondition (not (choice-made))
    :effect (and (choice-made) (selected dist4)
      (available lis1) (available lis2) (available lis3) (available lis4) (available lis5) (available lis6)
      (available flor1) (available flor2) (available flor3)
      (available cop1) (available cop2) (available cop3) (available cop4) (available cop5) (available cop6)
    )
    :cost 0
  )

  (:action select-dist5
    :parameters ()
    :precondition (not (choice-made))
    :effect (and (choice-made) (selected dist5)
      (available lis1) (available lis2) (available lis3) (available lis4) (available lis5) (available lis6)
      (available flor1) (available flor2) (available flor3) (available flor4)
      (available cop1) (available cop2) (available cop3) (available cop4) (available cop5)
    )
    :cost 0
  )

  (:action select-dist6
    :parameters ()
    :precondition (not (choice-made))
    :effect (and (choice-made) (selected dist6)
      (available lis1) (available lis2) (available lis3) (available lis4) (available lis5)
      (available flor1) (available flor2) (available flor3) (available flor4)
      (available cop1) (available cop2) (available cop3) (available cop4) (available cop5) (available cop6)
    )
    :cost 0
  )
)