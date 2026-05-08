(define (domain itinerary-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:constants
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    florence amsterdam riga - city
  )

  (:predicates
    (next ?d1 - day ?d2 - day)
    (in-day ?d - day ?c - city)
    (assigned ?d - day)
    (workshop-held)
  )

  (:action planner-assign-start-day1
    :parameters ()
    :precondition (and (not (assigned day1)))
    :effect (and (in-day day1 florence) (assigned day1))
  )

  (:action planner-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 ?c) (not (assigned ?d2)))
    :effect (and (in-day ?d2 ?c) (assigned ?d2))
  )

  (:action flight-travel-florence-amsterdam
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 florence) (not (assigned ?d2)))
    :effect (and (in-day ?d2 amsterdam) (assigned ?d2))
  )

  (:action flight-travel-amsterdam-riga
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 amsterdam) (not (assigned ?d2)))
    :effect (and (in-day ?d2 riga) (assigned ?d2))
  )

  (:action schedule-workshop-day1
    :parameters ()
    :precondition (and (in-day day1 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
  (:action schedule-workshop-day2
    :parameters ()
    :precondition (and (in-day day2 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
  (:action schedule-workshop-day3
    :parameters ()
    :precondition (and (in-day day3 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
  (:action schedule-workshop-day4
    :parameters ()
    :precondition (and (in-day day4 florence) (not (workshop-held)))
    :effect (workshop-held)
  )
)