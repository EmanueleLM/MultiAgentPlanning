(define (domain hanoi_agents_2)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk d is directly on place p (place = disk or peg)
    (on ?d - disk ?p - place)
    ;; a place (disk or peg) has no disk on top of it
    (clear ?p - place)
    ;; size order: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; permissions for agents to move certain disks
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
  )

  ;; ========== Actions for agent_1 (can move only disks A-J) ==========
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (agent1_allowed ?d)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ;; from becomes clear after removing the top disk
              (clear ?from)
              ;; destination (peg) now has a disk on top -> not clear
              (not (clear ?to))
            )
  )

  (:action move-agent1-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (agent1_allowed ?d)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; ========== Actions for agent_2 (can move only disks K-T) ==========
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
                    (agent2_allowed ?d)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action move-agent2-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
                    (agent2_allowed ?d)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )
)