(define (domain Hanoi3Agents20DisksInstance3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?under - disk)     ; disk ?d is directly on top of disk ?under
    (on-peg  ?d - disk ?p - peg)          ; disk ?d is directly on peg ?p
    (top ?d - disk ?p - peg)              ; disk ?d is the top disk on peg ?p (no disk on top of ?d)
    (empty ?p - peg)                      ; peg ?p currently has no disks
    (smaller ?a - disk ?b - disk)         ; static size relation: ?a is smaller than ?b
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
  )

  ;; ACTIONS for agent_1 (can move disks A..G)
  ;; 1) source: on-disk, target: empty peg
  (:action move_agent1_from_disk_to_empty_peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )

  ;; 2) source: on-disk, target: on top of some disk (?target) on peg ?to
  (:action move_agent1_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?target ?to)
      (smaller ?d ?target)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (on-disk ?d ?target)
      (not (top ?target ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )

  ;; 3) source: on-peg, target: empty peg
  (:action move_agent1_from_peg_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?d ?to)
    )
  )

  ;; 4) source: on-peg, target: on top of some disk (?target) on peg ?to
  (:action move_agent1_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?target ?to)
      (smaller ?d ?target)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (on-disk ?d ?target)
      (not (top ?target ?to))
      (top ?d ?to)
    )
  )

  ;; ACTIONS for agent_2 (can move disks H..N) -- identical structure, different capability predicate
  (:action move_agent2_from_disk_to_empty_peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )

  (:action move_agent2_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?target ?to)
      (smaller ?d ?target)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (on-disk ?d ?target)
      (not (top ?target ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )

  (:action move_agent2_from_peg_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?d ?to)
    )
  )

  (:action move_agent2_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?target ?to)
      (smaller ?d ?target)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (on-disk ?d ?target)
      (not (top ?target ?to))
      (top ?d ?to)
    )
  )

  ;; ACTIONS for agent_3 (can move disks O..T)
  (:action move_agent3_from_disk_to_empty_peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
      (can-move-agent3 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )

  (:action move_agent3_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?target ?to)
      (smaller ?d ?target)
      (can-move-agent3 ?d)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (on-disk ?d ?target)
      (not (top ?target ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )

  (:action move_agent3_from_peg_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (can-move-agent3 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (top ?d ?to)
    )
  )

  (:action move_agent3_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?target ?to)
      (smaller ?d ?target)
      (can-move-agent3 ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)
      (on-disk ?d ?target)
      (not (top ?target ?to))
      (top ?d ?to)
    )
  )
)