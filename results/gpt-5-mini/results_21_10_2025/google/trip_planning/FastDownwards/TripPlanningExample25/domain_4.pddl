(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (flight ?c1 - city ?c2 - city)
  )

  ;; Valencia agent actions
  (:action valencia_agent_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d valencia)
      (next ?d ?d2)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 valencia)
    )
  )

  (:action valencia_agent_fly_to_lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d valencia)
      (next ?d ?d2)
      (flight valencia lyon)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 lyon)
    )
  )

  ;; Lyon agent actions
  (:action lyon_agent_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d lyon)
      (next ?d ?d2)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 lyon)
    )
  )

  (:action lyon_agent_fly_to_valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d lyon)
      (next ?d ?d2)
      (flight lyon valencia)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 valencia)
    )
  )

  (:action lyon_agent_fly_to_split
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d lyon)
      (next ?d ?d2)
      (flight lyon split)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 split)
    )
  )

  ;; Split agent actions
  (:action split_agent_stay
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d split)
      (next ?d ?d2)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 split)
    )
  )

  (:action split_agent_fly_to_lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (assigned ?d split)
      (next ?d ?d2)
      (flight split lyon)
      (not (assigned ?d2 valencia))
      (not (assigned ?d2 lyon))
      (not (assigned ?d2 split))
    )
    :effect (and
      (assigned ?d2 lyon)
    )
  )
)