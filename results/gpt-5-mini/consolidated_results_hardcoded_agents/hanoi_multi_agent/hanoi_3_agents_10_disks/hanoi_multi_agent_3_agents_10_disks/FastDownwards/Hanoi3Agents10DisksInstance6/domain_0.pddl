(define (domain hanoi_three_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)  ; disks and pegs are places (supports)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)                  ; nothing is on top of place ?p (peg or disk)
    (smaller ?d1 - disk ?d2 - disk)     ; ?d1 is smaller than ?d2
    (allowed-agent1 ?d - disk)          ; agent1 is permitted to move this disk
    (allowed-agent2 ?d - disk)          ; agent2 is permitted to move this disk
    (allowed-agent3 ?d - disk)          ; agent3 is permitted to move this disk
  )

  ;; Agent 1 actions: may move only disks permitted by (allowed-agent1 ?d)
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed-agent1 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 actions (modeled distinctly; no allowed disks specified in provided input,
  ;; so these actions will be inert unless allowed-agent2 facts are provided in a problem)
  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed-agent2 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 3 actions (modeled distinctly; no allowed disks specified in provided input)
  (:action move_agent3_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed-agent3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_agent3_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed-agent3 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

)