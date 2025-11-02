(define (domain integrated_trip)
  (:requirements :strips :typing :negative-preconditions :equality :fluents)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from ?to - city)
    (current-day ?d - day)
    (next ?d1 ?d2 - day)
    (attended9)
    (attended15)
  )

  (:functions
    (days-left)
    (stay-vienna)
    (stay-vilnius)
    (stay-valencia)
  )

  ;; Agent1 actions
  (:action agent1-stay-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna) (current-day ?d) (next ?d ?d2) (> (stay-vienna) 0))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (stay-vienna) 1)
      (decrease (days-left) 1)
    )
  )

  (:action agent1-stay-vilnius
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vilnius) (current-day ?d) (next ?d ?d2) (> (stay-vilnius) 0))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (stay-vilnius) 1)
      (decrease (days-left) 1)
    )
  )

  (:action agent1-stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia) (current-day ?d) (next ?d ?d2) (> (stay-valencia) 0))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (stay-valencia) 1)
      (decrease (days-left) 1)
    )
  )

  (:action agent1-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from) (direct ?from ?to) (current-day ?d) (next ?d ?d2) (> (days-left) 0))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (days-left) 1)
    )
  )

  (:action agent1-attend-day9
    :parameters ()
    :precondition (and (at valencia) (current-day day9) (not (attended9)))
    :effect (attended9)
  )

  (:action agent1-attend-day15
    :parameters ()
    :precondition (and (at valencia) (current-day day15) (not (attended15)))
    :effect (attended15)
  )

  ;; Agent2 actions (kept distinct)
  (:action agent2-stay-vienna
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vienna) (current-day ?d) (next ?d ?d2) (> (stay-vienna) 0))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (stay-vienna) 1)
      (decrease (days-left) 1)
    )
  )

  (:action agent2-stay-vilnius
    :parameters (?d - day ?d2 - day)
    :precondition (and (at vilnius) (current-day ?d) (next ?d ?d2) (> (stay-vilnius) 0))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (stay-vilnius) 1)
      (decrease (days-left) 1)
    )
  )

  (:action agent2-stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia) (current-day ?d) (next ?d ?d2) (> (stay-valencia) 0))
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (stay-valencia) 1)
      (decrease (days-left) 1)
    )
  )

  (:action agent2-fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from) (direct ?from ?to) (current-day ?d) (next ?d ?d2) (> (days-left) 0))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current-day ?d))
      (current-day ?d2)
      (decrease (days-left) 1)
    )
  )

  (:action agent2-attend-day9
    :parameters ()
    :precondition (and (at valencia) (current-day day9) (not (attended9)))
    :effect (attended9)
  )

  (:action agent2-attend-day15
    :parameters ()
    :precondition (and (at valencia) (current-day day15) (not (attended15)))
    :effect (attended15)
  )

)