(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk disk1 disk2 peg)

  (:predicates
    ;; immediate support relations
    (on-disk ?d - disk ?below - disk)   ; ?d immediately on top of disk ?below
    (on-peg ?d - disk ?p - peg)         ; ?d immediately on peg ?p (i.e., bottom disk on that peg)
    (clear ?d - disk)                   ; no disk on top of ?d
    (empty ?p - peg)                    ; peg has no disks
    (smaller ?d - disk ?d2 - disk)      ; ?d is strictly smaller than ?d2
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions for agent_1 (may move disks A..J i.e. type disk1)
  ;; Four action variants to handle whether the source is on another disk or on a peg,
  ;; and whether the destination is an empty peg or onto an existing top disk.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; 1) move a disk1 that is on top of another disk to an empty peg
  (:action move_from_disk_to_empty_by_agent_1
    :parameters (?d - disk1 ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      ;; the disk below becomes clear after removing ?d
      (clear ?below)
      ;; ?d remains clear (it's top at destination)
      (clear ?d)
    )
  )

  ;; 2) move a disk1 that is on top of another disk to sit on another disk
  (:action move_from_disk_to_disk_by_agent_1
    :parameters (?d - disk1 ?below - disk ?dst - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?dst)
      ;; dst is no longer clear (now has ?d on top)
      (not (clear ?dst))
      ;; the disk below becomes clear after removing ?d
      (clear ?below)
      ;; ?d is top at its new location
      (clear ?d)
    )
  )

  ;; 3) move a disk1 that is on a peg (it is the only disk on that peg) to an empty peg
  (:action move_from_peg_to_empty_by_agent_1
    :parameters (?d - disk1 ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      ;; source peg becomes empty
      (empty ?from)
      (clear ?d)
    )
  )

  ;; 4) move a disk1 that is on a peg (only disk on that peg) to sit on another disk
  (:action move_from_peg_to_disk_by_agent_1
    :parameters (?d - disk1 ?from - peg ?dst - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      ;; source peg becomes empty
      (empty ?from)
      (clear ?d)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions for agent_2 (may move disks K..T i.e. type disk2)
  ;; Mirror of the four agent_1 actions, but typed for disk2 to enforce move restrictions.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action move_from_disk_to_empty_by_agent_2
    :parameters (?d - disk2 ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move_from_disk_to_disk_by_agent_2
    :parameters (?d - disk2 ?below - disk ?dst - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move_from_peg_to_empty_by_agent_2
    :parameters (?d - disk2 ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (clear ?d)
    )
  )

  (:action move_from_peg_to_disk_by_agent_2
    :parameters (?d - disk2 ?from - peg ?dst - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      (empty ?from)
      (clear ?d)
    )
  )
)