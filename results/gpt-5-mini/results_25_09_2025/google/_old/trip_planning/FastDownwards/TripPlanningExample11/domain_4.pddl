(define (domain integrated_trip)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types city day token)

  (:predicates
    (at ?c - city)
    (direct ?from ?to - city)
    (current-day ?d - day)
    (next ?d1 ?d2 - day)
    (attended9)
    (attended15)
    (for-city ?t - token ?c - city)
    (consumed ?t - token)
  )

  ;; Agent1 actions
  (:action agent1-stay-vienna
    :parameters (?t - token ?d - day ?d2 - day)
    :precondition (and
      (at vienna)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t vienna)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent1-stay-vilnius
    :parameters (?t - token ?d - day ?d2 - day)
    :precondition (and
      (at vilnius)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t vilnius)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent1-stay-valencia
    :parameters (?t - token ?d - day ?d2 - day)
    :precondition (and
      (at valencia)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t valencia)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent1-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  (:action agent1-attend-day9
    :parameters ()
    :precondition (and (at valencia) (current-day day9) (not (attended9)))
    :effect (attended9)
    :cost 0
  )

  (:action agent1-attend-day15
    :parameters ()
    :precondition (and (at valencia) (current-day day15) (not (attended15)))
    :effect (attended15)
    :cost 0
  )

  ;; Agent2 actions (kept distinct)
  (:action agent2-stay-vienna
    :parameters (?t - token ?d - day ?d2 - day)
    :precondition (and
      (at vienna)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t vienna)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent2-stay-vilnius
    :parameters (?t - token ?d - day ?d2 - day)
    :precondition (and
      (at vilnius)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t vilnius)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent2-stay-valencia
    :parameters (?t - token ?d - day ?d2 - day)
    :precondition (and
      (at valencia)
      (current-day ?d)
      (next ?d ?d2)
      (for-city ?t valencia)
      (not (consumed ?t))
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (consumed ?t)
    )
    :cost 1
  )

  (:action agent2-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current-day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
    )
    :cost 1
  )

  (:action agent2-attend-day9
    :parameters ()
    :precondition (and (at valencia) (current-day day9) (not (attended9)))
    :effect (attended9)
    :cost 0
  )

  (:action agent2-attend-day15
    :parameters ()
    :precondition (and (at valencia) (current-day day15) (not (attended15)))
    :effect (attended15)
    :cost 0
  )
)