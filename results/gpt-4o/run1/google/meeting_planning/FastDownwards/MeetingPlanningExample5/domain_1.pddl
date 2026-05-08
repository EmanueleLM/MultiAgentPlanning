(define (domain meeting_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time person)
  (:predicates
    (at ?loc - location)
    (visited ?loc - location)
    (available ?person - person ?loc - location ?start - time ?end - time)
    (meeting_scheduled ?person - person)
    (time_valid ?time - time)
    (can_meet ?loc - location ?person - person ?start - time ?end - time)
  )
  
  (:action move
    :parameters (?from - location ?to - location ?start - time ?end - time)
    :precondition (and 
                    (at ?from)
                    (time_valid ?start)
                    (time_valid ?end)
                    (not (at ?to))
                    (or
                      (and (at nob_hill) (= ?from nob_hill) (= ?to the_castro) (= ?start t_09_00) (= ?end t_12_15))
                      (and (at the_castro) (= ?from the_castro) (= ?to nob_hill) (= ?start t_13_30) (= ?end t_22_00))
                    )
                  )
    :effect (and
              (not (at ?from))
              (at ?to)
              (visited ?to)
            )
  )
  
  (:action schedule_meeting
    :parameters (?person - person ?location - location ?start - time ?end - time)
    :precondition (and
                    (at ?location)
                    (available ?person ?location ?start ?end)
                    (can_meet ?location ?person ?start ?end)
                    (not (meeting_scheduled ?person))
                  )
    :effect (meeting_scheduled ?person)
  )
)