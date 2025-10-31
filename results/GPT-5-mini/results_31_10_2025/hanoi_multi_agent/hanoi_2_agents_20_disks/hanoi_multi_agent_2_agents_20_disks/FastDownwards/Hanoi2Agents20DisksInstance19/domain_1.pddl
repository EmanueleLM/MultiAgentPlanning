(define (domain cooperative-hanoi)
  :requirements :strips :typing :negative-preconditions
  :types disk peg step

  :predicates
    ;; disk d is located on peg p
    (on-peg ?d - disk ?p - peg)
    ;; ownership predicates
    (agent1_owned ?d - disk)
    (agent2_owned ?d - disk)
    ;; allowed move table: at step s, disk d may move from ?from to ?to
    (allowed-move ?s - step ?d - disk ?from - peg ?to - peg)
    ;; step control predicates
    (step ?s - step)
    (next ?s - step ?s2 - step)

  ;; Agent 1 move action: can only be applied when an allowed-move for the current step exists
  (:action agent_1_move
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on-peg ?d ?from)
      (agent1_owned ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (step ?s))
      (step ?s2)
    )
  )

  ;; Agent 2 move action: symmetric but requires agent2 ownership
  (:action agent_2_move
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step ?s)
      (next ?s ?s2)
      (allowed-move ?s ?d ?from ?to)
      (on-peg ?d ?from)
      (agent2_owned ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (step ?s))
      (step ?s2)
    )
  )
)