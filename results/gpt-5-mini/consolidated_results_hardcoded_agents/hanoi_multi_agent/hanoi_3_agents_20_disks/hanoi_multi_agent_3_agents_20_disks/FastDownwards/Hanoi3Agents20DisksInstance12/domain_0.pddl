(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg place)
  ;; disks and pegs are places: disk and peg are subtypes of place
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = disk or peg)
    (clear ?p - place)              ; nothing is on top of place ?p (place can be a disk or a peg)
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
    (agent1_allowed ?d - disk)      ; agent_1 permitted to move ?d
    (agent2_allowed ?d - disk)      ; agent_2 permitted to move ?d
    (agent3_allowed ?d - disk)      ; agent_3 permitted to move ?d
  )

  ;; Moves where the destination is a peg
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (agent1_allowed ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (agent2_allowed ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent3_to_peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (agent3_allowed ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Moves where the destination is another disk (must be larger than the moving disk)
  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (agent1_allowed ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (agent2_allowed ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent3_to_disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to) (agent3_allowed ?d))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)