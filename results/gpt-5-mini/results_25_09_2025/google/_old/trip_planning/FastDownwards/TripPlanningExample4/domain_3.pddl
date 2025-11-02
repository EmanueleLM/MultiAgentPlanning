(define (domain orchestrator_combined)
  (:requirements :typing :adl :negative-preconditions :equality :action-costs)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (allowed-meet ?d - day)
    (met ?d - day)

    ; count predicates for each city's accumulated days
    (seville_count_0) (seville_count_1) (seville_count_2) (seville_count_3) (seville_count_4) (seville_count_5) (seville_count_6) (seville_count_7)
    (munich_count_0) (munich_count_1) (munich_count_2) (munich_count_3) (munich_count_4) (munich_count_5)
    (tallinn_count_0) (tallinn_count_1) (tallinn_count_2)
  )

  ; stay in a city for the next day (counts increment for that city)
  (:action stay-seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at seville ?d1) (succ ?d1 ?d2))
    :effect (and
      (not (at seville ?d1))
      (at seville ?d2)

      (when (seville_count_0) (and (not (seville_count_0)) (seville_count_1)))
      (when (seville_count_1) (and (not (seville_count_1)) (seville_count_2)))
      (when (seville_count_2) (and (not (seville_count_2)) (seville_count_3)))
      (when (seville_count_3) (and (not (seville_count_3)) (seville_count_4)))
      (when (seville_count_4) (and (not (seville_count_4)) (seville_count_5)))
      (when (seville_count_5) (and (not (seville_count_5)) (seville_count_6)))
      (when (seville_count_6) (and (not (seville_count_6)) (seville_count_7)))
    )
    :cost 1
  )

  (:action stay-munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at munich ?d1) (succ ?d1 ?d2))
    :effect (and
      (not (at munich ?d1))
      (at munich ?d2)

      (when (munich_count_0) (and (not (munich_count_0)) (munich_count_1)))
      (when (munich_count_1) (and (not (munich_count_1)) (munich_count_2)))
      (when (munich_count_2) (and (not (munich_count_2)) (munich_count_3)))
      (when (munich_count_3) (and (not (munich_count_3)) (munich_count_4)))
      (when (munich_count_4) (and (not (munich_count_4)) (munich_count_5)))
    )
    :cost 1
  )

  (:action stay-tallinn
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at tallinn ?d1) (succ ?d1 ?d2))
    :effect (and
      (not (at tallinn ?d1))
      (at tallinn ?d2)

      (when (tallinn_count_0) (and (not (tallinn_count_0)) (tallinn_count_1)))
      (when (tallinn_count_1) (and (not (tallinn_count_1)) (tallinn_count_2)))
    )
    :cost 1
  )

  ; flights - move between cities and increment arrival city's count
  (:action fly-seville-to-munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at seville ?d1) (succ ?d1 ?d2) (flight seville munich))
    :effect (and
      (not (at seville ?d1))
      (at munich ?d2)

      (when (munich_count_0) (and (not (munich_count_0)) (munich_count_1)))
      (when (munich_count_1) (and (not (munich_count_1)) (munich_count_2)))
      (when (munich_count_2) (and (not (munich_count_2)) (munich_count_3)))
      (when (munich_count_3) (and (not (munich_count_3)) (munich_count_4)))
      (when (munich_count_4) (and (not (munich_count_4)) (munich_count_5)))
    )
    :cost 1
  )

  (:action fly-munich-to-seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at munich ?d1) (succ ?d1 ?d2) (flight munich seville))
    :effect (and
      (not (at munich ?d1))
      (at seville ?d2)

      (when (seville_count_0) (and (not (seville_count_0)) (seville_count_1)))
      (when (seville_count_1) (and (not (seville_count_1)) (seville_count_2)))
      (when (seville_count_2) (and (not (seville_count_2)) (seville_count_3)))
      (when (seville_count_3) (and (not (seville_count_3)) (seville_count_4)))
      (when (seville_count_4) (and (not (seville_count_4)) (seville_count_5)))
      (when (seville_count_5) (and (not (seville_count_5)) (seville_count_6)))
      (when (seville_count_6) (and (not (seville_count_6)) (seville_count_7)))
    )
    :cost 1
  )

  (:action fly-munich-to-tallinn
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at munich ?d1) (succ ?d1 ?d2) (flight munich tallinn))
    :effect (and
      (not (at munich ?d1))
      (at tallinn ?d2)

      (when (tallinn_count_0) (and (not (tallinn_count_0)) (tallinn_count_1)))
      (when (tallinn_count_1) (and (not (tallinn_count_1)) (tallinn_count_2)))
    )
    :cost 1
  )

  (:action fly-tallinn-to-munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at tallinn ?d1) (succ ?d1 ?d2) (flight tallinn munich))
    :effect (and
      (not (at tallinn ?d1))
      (at munich ?d2)

      (when (munich_count_0) (and (not (munich_count_0)) (munich_count_1)))
      (when (munich_count_1) (and (not (munich_count_1)) (munich_count_2)))
      (when (munich_count_2) (and (not (munich_count_2)) (munich_count_3)))
      (when (munich_count_3) (and (not (munich_count_3)) (munich_count_4)))
      (when (munich_count_4) (and (not (munich_count_4)) (munich_count_5)))
    )
    :cost 1
  )

  (:action meet-in-tallinn
    :parameters (?d - day)
    :precondition (and (at tallinn ?d) (allowed-meet ?d))
    :effect (and
      (met ?d)
    )
    :cost 0
  )
)