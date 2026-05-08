(define (domain hanoi-2agents-10)
  (:requirements :negative-preconditions)
  (:predicates
    (on ?d ?p)
    (clear ?p)
    (can-place ?d ?p)
    (allowed ?a ?d)
  )

  (:action move_agent_1
    :parameters (?d ?from ?to)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2
    :parameters (?d ?from ?to)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (allowed agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)