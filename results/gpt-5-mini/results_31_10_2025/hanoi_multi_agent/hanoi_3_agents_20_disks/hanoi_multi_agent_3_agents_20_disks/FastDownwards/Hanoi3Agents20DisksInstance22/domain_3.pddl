(define (domain hanoi-3agents)
  (:requirements :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)         ; disk ?d is directly on object ?s (disk or peg)
    (clear ?d - disk)                 ; no disk on top of ?d
    (clear-peg ?p - peg)              ; peg ?p currently has no disks
    (allowed1 ?d - disk)
    (allowed2 ?d - disk)
    (allowed3 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2 (static)
  )

  ;; Actions for agent_1 (disks A..G)
  (:action move_agent_1_disk_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?target - disk)
    :precondition (and (allowed1 ?d) (on ?d ?under) (clear ?d) (clear ?target) (smaller ?d ?target))
    :effect (and
      (not (on ?d ?under))
      (on ?d ?target)
      (clear ?under)
      (not (clear ?target))
    )
  )

  (:action move_agent_1_disk_from_disk_to_peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and (allowed1 ?d) (on ?d ?under) (clear ?d) (clear-peg ?to))
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear-peg ?to))
    )
  )

  (:action move_agent_1_disk_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and (allowed1 ?d) (on ?d ?from) (clear ?d) (clear ?target) (smaller ?d ?target))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear-peg ?from)
      (not (clear ?target))
    )
  )

  (:action move_agent_1_disk_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (allowed1 ?d) (on ?d ?from) (clear ?d) (clear-peg ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Actions for agent_2 (disks H..N)
  (:action move_agent_2_disk_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?target - disk)
    :precondition (and (allowed2 ?d) (on ?d ?under) (clear ?d) (clear ?target) (smaller ?d ?target))
    :effect (and
      (not (on ?d ?under))
      (on ?d ?target)
      (clear ?under)
      (not (clear ?target))
    )
  )

  (:action move_agent_2_disk_from_disk_to_peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and (allowed2 ?d) (on ?d ?under) (clear ?d) (clear-peg ?to))
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear-peg ?to))
    )
  )

  (:action move_agent_2_disk_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and (allowed2 ?d) (on ?d ?from) (clear ?d) (clear ?target) (smaller ?d ?target))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear-peg ?from)
      (not (clear ?target))
    )
  )

  (:action move_agent_2_disk_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (allowed2 ?d) (on ?d ?from) (clear ?d) (clear-peg ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Actions for agent_3 (disks O..T)
  (:action move_agent_3_disk_from_disk_to_disk
    :parameters (?d - disk ?under - disk ?target - disk)
    :precondition (and (allowed3 ?d) (on ?d ?under) (clear ?d) (clear ?target) (smaller ?d ?target))
    :effect (and
      (not (on ?d ?under))
      (on ?d ?target)
      (clear ?under)
      (not (clear ?target))
    )
  )

  (:action move_agent_3_disk_from_disk_to_peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and (allowed3 ?d) (on ?d ?under) (clear ?d) (clear-peg ?to))
    :effect (and
      (not (on ?d ?under))
      (on ?d ?to)
      (clear ?under)
      (not (clear-peg ?to))
    )
  )

  (:action move_agent_3_disk_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?target - disk)
    :precondition (and (allowed3 ?d) (on ?d ?from) (clear ?d) (clear ?target) (smaller ?d ?target))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear-peg ?from)
      (not (clear ?target))
    )
  )

  (:action move_agent_3_disk_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and (allowed3 ?d) (on ?d ?from) (clear ?d) (clear-peg ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )
)