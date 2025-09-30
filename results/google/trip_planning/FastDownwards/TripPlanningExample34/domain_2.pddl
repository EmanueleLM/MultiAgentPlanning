(define (domain travel)
  (:requirements :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city)
  )

  (:action stay-valencia-day1
    :parameters ()
    :precondition (at valencia day1)
    :effect (and (at valencia day2) (visited valencia))
  )

  (:action fly-valencia-frankfurt-day2
    :parameters ()
    :precondition (at valencia day2)
    :effect (and (at frankfurt day3) (visited frankfurt))
  )

  (:action stay-frankfurt-day3
    :parameters ()
    :precondition (at frankfurt day3)
    :effect (and (at frankfurt day4) (visited frankfurt))
  )

  (:action stay-frankfurt-day4
    :parameters ()
    :precondition (at frankfurt day4)
    :effect (and (at frankfurt day5) (visited frankfurt))
  )

  (:action stay-frankfurt-day5
    :parameters ()
    :precondition (at frankfurt day5)
    :effect (and (at frankfurt day6) (visited frankfurt))
  )

  (:action stay-frankfurt-day6
    :parameters ()
    :precondition (at frankfurt day6)
    :effect (and (at frankfurt day7) (visited frankfurt))
  )

  (:action fly-frankfurt-florence-day7
    :parameters ()
    :precondition (at frankfurt day7)
    :effect (and (at florence day8) (visited florence))
  )

  (:action stay-florence-day8
    :parameters ()
    :precondition (at florence day8)
    :effect (and (at florence day9) (visited florence))
  )
)