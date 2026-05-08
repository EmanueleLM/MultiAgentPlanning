(define (domain meet_friends)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend time)
  (:predicates
    (at ?loc - location ?time - time)
    (friend_at ?friend - friend ?loc - location ?time - time)
    (met ?friend - friend ?time - time)
    (next ?time1 - time ?time2 - time)
  )
  
  (:action travel
    :parameters (?from - location ?to - location ?start - time ?end - time)
    :precondition 
      (and 
        (at ?from ?start)
        (next ?start ?end)
      )
    :effect 
      (and 
        (not (at ?from ?start))
        (at ?to ?end)
      )
  )

  (:action meet
    :parameters (?friend - friend ?loc - location ?time - time)
    :precondition 
      (and 
        (at ?loc ?time)
        (friend_at ?friend ?loc ?time)
        (not (met ?friend ?time))
      )
    :effect 
      (met ?friend ?time)
  )
)