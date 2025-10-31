(define (domain two-agent-hanoi-15-twoagents)
  :requirements :strips :typing :negative-preconditions
  :types disk peg

  :predicates
    (on-peg ?d - disk ?p - peg)         ; disk is directly on the peg (bottom disk)
    (on-disk ?d - disk ?d2 - disk)      ; disk ?d is directly on disk ?d2
    (top ?p - peg ?d - disk)            ; ?d is the top disk of peg ?p
    (empty ?p - peg)                    ; peg is empty
    (smaller ?d1 - disk ?d2 - disk)     ; ?d1 is smaller than ?d2
    (can-move-agent1 ?d - disk)         ; marker: agent_1 may move ?d
    (can-move-agent2 ?d - disk)         ; marker: agent_2 may move ?d

  :constants left middle right - peg

  ;; agent_1: move a top disk that sits on another disk -> to an empty peg
  (:action agent_1_move_from_on_disk_to_empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move-agent1 ?d)
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (empty ?to))
      (top ?from ?below)
    )
  )

  ;; agent_1: move a top disk that is the bottom disk of the peg -> to an empty peg
  (:action agent_1_move_from_on_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move-agent1 ?d)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; agent_1: move a top disk that sits on another disk -> onto another disk (non-empty target)
  (:action agent_1_move_from_on_disk_to_disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (can-move-agent1 ?d)
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below))
      (on-disk ?d ?target)
      (not (top ?to ?target))
      (top ?to ?d)
      (top ?from ?below)
    )
  )

  ;; agent_1: move a top disk that is the bottom disk of the peg -> onto another disk (non-empty target)
  (:action agent_1_move_from_on_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (can-move-agent1 ?d)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (on-disk ?d ?target)
      (not (top ?to ?target))
      (top ?to ?d)
      (empty ?from)
    )
  )

  ;; agent_2: move a top disk that sits on another disk -> to an empty peg
  (:action agent_2_move_from_on_disk_to_empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move-agent2 ?d)
      (top ?from ?d)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (empty ?to))
      (top ?from ?below)
    )
  )

  ;; agent_2: move a top disk that is the bottom disk of the peg -> to an empty peg
  (:action agent_2_move_from_on_peg_to_empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move-agent2 ?d)
      (top ?from ?d)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (top ?to ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; agent_2: move a top disk that sits on another disk -> onto another disk (non-empty target)
  (:action agent_2_move_from_on_disk_to_disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (can-move-agent2 ?d)
      (top ?from ?d)
      (on-disk ?d ?below)
      (top ?to ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-disk ?d ?below))
      (on-disk ?d ?target)
      (not (top ?to ?target))
      (top ?to ?d)
      (top ?from ?below)
    )
  )

  ;; agent_2: move a top disk that is the bottom disk of the peg -> onto another disk (non-empty target)
  (:action agent_2_move_from_on_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - peg ?target - disk)
    :precondition (and
      (can-move-agent2 ?d)
      (top ?from ?d)
      (on-peg ?d ?from)
      (top ?to ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (top ?from ?d))
      (not (on-peg ?d ?from))
      (on-disk ?d ?target)
      (not (top ?to ?target))
      (top ?to ?d)
      (empty ?from)
    )
  )
)