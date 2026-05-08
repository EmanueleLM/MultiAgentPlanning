(define (domain hanoi-multiagent)
  (:requirements :strips :typing)
  (:types support peg disk disk_a_e disk_f_j disk_k_o)

  ;; disks and pegs are supports (a support is either a disk or a peg)
  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (disk or peg)
    (clear ?d - disk)                 ; no disk on top of ?d
    (empty ?p - peg)                  ; peg ?p has no disks on it
    (smaller ?d1 - disk ?d2 - disk)   ; static: ?d1 is smaller than ?d2
  )

  ;; Agent 1 actions: may move disks A-E (type disk_a_e)

  (:action move_agent1_disk_disk
    :parameters (?d - disk_a_e ?from - disk ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent1_peg_disk
    :parameters (?d - disk_a_e ?from - peg ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent1_disk_peg
    :parameters (?d - disk_a_e ?from - disk ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
    )
  )

  (:action move_agent1_peg_peg
    :parameters (?d - disk_a_e ?from - peg ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Agent 2 actions: may move disks F-J (type disk_f_j)

  (:action move_agent2_disk_disk
    :parameters (?d - disk_f_j ?from - disk ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent2_peg_disk
    :parameters (?d - disk_f_j ?from - peg ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent2_disk_peg
    :parameters (?d - disk_f_j ?from - disk ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
    )
  )

  (:action move_agent2_peg_peg
    :parameters (?d - disk_f_j ?from - peg ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

  ;; Agent 3 actions: may move disks K-O (type disk_k_o)

  (:action move_agent3_disk_disk
    :parameters (?d - disk_k_o ?from - disk ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent3_peg_disk
    :parameters (?d - disk_k_o ?from - peg ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent3_disk_peg
    :parameters (?d - disk_k_o ?from - disk ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (empty ?to))
    )
  )

  (:action move_agent3_peg_peg
    :parameters (?d - disk_k_o ?from - peg ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (empty ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (empty ?to))
    )
  )

)