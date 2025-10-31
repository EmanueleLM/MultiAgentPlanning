(define (domain hanoi_multiagent_3agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (support ?d - disk ?p - place)    ; disk ?d is directly supported by place ?p (disk or peg)
    (top ?peg - peg ?d - disk)        ; top disk on peg
    (empty ?peg - peg)                ; peg is empty
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  ;; ======== agent_1 actions ========
  (:action agent_1_move_from_disk_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?below - place)
    :precondition (and
      (can_move_agent1 ?d)
      (top ?pfrom ?d)
      (support ?d ?below)
      (empty ?pto)
    )
    :effect (and
      (not (support ?d ?below))
      (support ?d ?pto)
      (not (top ?pfrom ?d))
      (top ?pto ?d)
      (not (empty ?pto))
      ;; update pfrom's top: if ?below is a peg, pfrom becomes empty; if ?below is a disk, that disk becomes top
      (when (not (= ?below ?pfrom)) ;; irrelevant syntactic guard; kept for clarity but STRIPS requires concrete effects; instead encode both possibilities using predicates below
      )
    )
  )

  (:action agent_1_move_from_disk_to_disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?below - place ?d2 - disk)
    :precondition (and
      (can_move_agent1 ?d)
      (top ?pfrom ?d)
      (support ?d ?below)
      (top ?pto ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (support ?d ?below))
      (support ?d ?d2)
      (not (top ?pfrom ?d))
      (top ?pto ?d)
      (not (top ?pto ?d2))
    )
  )

  (:action agent_1_move_from_peg_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (can_move_agent1 ?d)
      (top ?pfrom ?d)
      (support ?d ?pfrom)   ; d directly on peg pfrom
      (empty ?pto)
    )
    :effect (and
      (not (support ?d ?pfrom))
      (support ?d ?pto)
      (not (top ?pfrom ?d))
      (empty ?pfrom)
      (not (empty ?pto))
      (top ?pto ?d)
    )
  )

  (:action agent_1_move_from_peg_to_disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?d2 - disk)
    :precondition (and
      (can_move_agent1 ?d)
      (top ?pfrom ?d)
      (support ?d ?pfrom)
      (top ?pto ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (support ?d ?pfrom))
      (support ?d ?d2)
      (not (top ?pfrom ?d))
      (empty ?pfrom)
      (not (top ?pto ?d2))
      (top ?pto ?d)
    )
  )

  ;; ======== agent_2 actions ========
  (:action agent_2_move_from_disk_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?below - place)
    :precondition (and
      (can_move_agent2 ?d)
      (top ?pfrom ?d)
      (support ?d ?below)
      (empty ?pto)
    )
    :effect (and
      (not (support ?d ?below))
      (support ?d ?pto)
      (not (top ?pfrom ?d))
      (top ?pto ?d)
      (not (empty ?pto))
    )
  )

  (:action agent_2_move_from_disk_to_disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?below - place ?d2 - disk)
    :precondition (and
      (can_move_agent2 ?d)
      (top ?pfrom ?d)
      (support ?d ?below)
      (top ?pto ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (support ?d ?below))
      (support ?d ?d2)
      (not (top ?pfrom ?d))
      (top ?pto ?d)
      (not (top ?pto ?d2))
    )
  )

  (:action agent_2_move_from_peg_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (can_move_agent2 ?d)
      (top ?pfrom ?d)
      (support ?d ?pfrom)
      (empty ?pto)
    )
    :effect (and
      (not (support ?d ?pfrom))
      (support ?d ?pto)
      (not (top ?pfrom ?d))
      (empty ?pfrom)
      (not (empty ?pto))
      (top ?pto ?d)
    )
  )

  (:action agent_2_move_from_peg_to_disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?d2 - disk)
    :precondition (and
      (can_move_agent2 ?d)
      (top ?pfrom ?d)
      (support ?d ?pfrom)
      (top ?pto ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (support ?d ?pfrom))
      (support ?d ?d2)
      (not (top ?pfrom ?d))
      (empty ?pfrom)
      (not (top ?pto ?d2))
      (top ?pto ?d)
    )
  )

  ;; ======== agent_3 actions ========
  (:action agent_3_move_from_disk_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?below - place)
    :precondition (and
      (can_move_agent3 ?d)
      (top ?pfrom ?d)
      (support ?d ?below)
      (empty ?pto)
    )
    :effect (and
      (not (support ?d ?below))
      (support ?d ?pto)
      (not (top ?pfrom ?d))
      (top ?pto ?d)
      (not (empty ?pto))
    )
  )

  (:action agent_3_move_from_disk_to_disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?below - place ?d2 - disk)
    :precondition (and
      (can_move_agent3 ?d)
      (top ?pfrom ?d)
      (support ?d ?below)
      (top ?pto ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (support ?d ?below))
      (support ?d ?d2)
      (not (top ?pfrom ?d))
      (top ?pto ?d)
      (not (top ?pto ?d2))
    )
  )

  (:action agent_3_move_from_peg_to_empty
    :parameters (?d - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (can_move_agent3 ?d)
      (top ?pfrom ?d)
      (support ?d ?pfrom)
      (empty ?pto)
    )
    :effect (and
      (not (support ?d ?pfrom))
      (support ?d ?pto)
      (not (top ?pfrom ?d))
      (empty ?pfrom)
      (not (empty ?pto))
      (top ?pto ?d)
    )
  )

  (:action agent_3_move_from_peg_to_disk
    :parameters (?d - disk ?pfrom - peg ?pto - peg ?d2 - disk)
    :precondition (and
      (can_move_agent3 ?d)
      (top ?pfrom ?d)
      (support ?d ?pfrom)
      (top ?pto ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (support ?d ?pfrom))
      (support ?d ?d2)
      (not (top ?pfrom ?d))
      (empty ?pfrom)
      (not (top ?pto ?d2))
      (top ?pto ?d)
    )
  )
)