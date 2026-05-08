(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-peg ?d - disk ?p - peg)        ; disk directly on peg (bottom disk on that peg)
    (on-disk ?d - disk ?under - disk) ; disk directly on another disk
    (top ?d - disk ?p - peg)          ; disk is top disk on peg
    (empty ?p - peg)                  ; peg currently empty
    (clear ?d - disk)                 ; disk has no disk on top
    (can_move ?a - agent ?d - disk)   ; agent can move this disk
    (larger ?d1 - disk ?d2 - disk)    ; d1 is strictly larger than d2
  )

  ;; ACTIONS FOR AGENT_1
  ;; 1) agent_1 moves a disk that is on top of another disk, to an empty peg
  (:action agent_1_move_from_on_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move agent_1 ?d)
      (on-disk ?d ?under)
      (top ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      ; remove the relation that ?d was on ?under
      (not (on-disk ?d ?under))
      ; ?under becomes top on source peg and becomes clear
      (top ?under ?from)
      (clear ?under)
      ; remove top status of ?d at source
      (not (top ?d ?from))
      ; place ?d as bottom/top on destination peg
      (on-peg ?d ?to)
      (top ?d ?to)
      ; destination is no longer empty
      (not (empty ?to))
      ; ?d remains clear (no disk above it at destination)
      (clear ?d)
    )
  )

  ;; 2) agent_1 moves a disk that is on top of another disk, onto another disk (stack)
  (:action agent_1_move_from_on_disk_to_disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topdest - disk)
    :precondition (and
      (can_move agent_1 ?d)
      (on-disk ?d ?under)
      (top ?d ?from)
      (top ?topdest ?to)
      (larger ?topdest ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?under))
      ; after moving, ?under becomes top and clear on source peg
      (top ?under ?from)
      (clear ?under)
      (not (top ?d ?from))
      ; place ?d on top of ?topdest
      (on-disk ?d ?topdest)
      (not (top ?topdest ?to))
      (top ?d ?to)
      ; topdest no longer clear
      (not (clear ?topdest))
      ; moved disk is clear
      (clear ?d)
    )
  )

  ;; 3) agent_1 moves a disk that is directly on the peg (bottom disk), to an empty peg
  (:action agent_1_move_from_on_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move agent_1 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      ; source peg becomes empty
      (empty ?from)
      (not (top ?d ?from))
      ; place ?d on destination peg
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  ;; 4) agent_1 moves a disk that is directly on the peg, onto another disk
  (:action agent_1_move_from_on_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?topdest - disk)
    :precondition (and
      (can_move agent_1 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?topdest ?to)
      (larger ?topdest ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (not (top ?d ?from))
      (on-disk ?d ?topdest)
      (not (top ?topdest ?to))
      (top ?d ?to)
      (not (clear ?topdest))
      (clear ?d)
    )
  )

  ;; ACTIONS FOR AGENT_2 (same schemas)
  (:action agent_2_move_from_on_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move agent_2 ?d)
      (on-disk ?d ?under)
      (top ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear ?under)
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action agent_2_move_from_on_disk_to_disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topdest - disk)
    :precondition (and
      (can_move agent_2 ?d)
      (on-disk ?d ?under)
      (top ?d ?from)
      (top ?topdest ?to)
      (larger ?topdest ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear ?under)
      (not (top ?d ?from))
      (on-disk ?d ?topdest)
      (not (top ?topdest ?to))
      (top ?d ?to)
      (not (clear ?topdest))
      (clear ?d)
    )
  )

  (:action agent_2_move_from_on_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move agent_2 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action agent_2_move_from_on_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?topdest - disk)
    :precondition (and
      (can_move agent_2 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?topdest ?to)
      (larger ?topdest ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (not (top ?d ?from))
      (on-disk ?d ?topdest)
      (not (top ?topdest ?to))
      (top ?d ?to)
      (not (clear ?topdest))
      (clear ?d)
    )
  )

  ;; ACTIONS FOR AGENT_3 (same schemas)
  (:action agent_3_move_from_on_disk_to_empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move agent_3 ?d)
      (on-disk ?d ?under)
      (top ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear ?under)
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action agent_3_move_from_on_disk_to_disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?topdest - disk)
    :precondition (and
      (can_move agent_3 ?d)
      (on-disk ?d ?under)
      (top ?d ?from)
      (top ?topdest ?to)
      (larger ?topdest ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear ?under)
      (not (top ?d ?from))
      (on-disk ?d ?topdest)
      (not (top ?topdest ?to))
      (top ?d ?to)
      (not (clear ?topdest))
      (clear ?d)
    )
  )

  (:action agent_3_move_from_on_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can_move agent_3 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action agent_3_move_from_on_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?topdest - disk)
    :precondition (and
      (can_move agent_3 ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?topdest ?to)
      (larger ?topdest ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (not (top ?d ?from))
      (on-disk ?d ?topdest)
      (not (top ?topdest ?to))
      (top ?d ?to)
      (not (clear ?topdest))
      (clear ?d)
    )
  )
)