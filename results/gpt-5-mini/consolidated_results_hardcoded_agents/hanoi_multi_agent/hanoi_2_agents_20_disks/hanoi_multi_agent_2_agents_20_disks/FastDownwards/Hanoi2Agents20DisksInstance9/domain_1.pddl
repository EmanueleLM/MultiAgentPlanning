(define (domain hanoi_two_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types place disk peg)
  (:predicates
    (on ?d - disk ?p - place)            ; disk d is directly on place p (disk or peg)
    (top ?p - peg ?d - disk)            ; disk d is the top disk on peg p
    (empty ?p - peg)                    ; peg p currently has no disks
    (allowed_agent1 ?d - disk)          ; agent_1 is allowed to move disk d
    (allowed_agent2 ?d - disk)          ; agent_2 is allowed to move disk d
    (smaller ?d1 - disk ?d2 - disk)     ; disk d1 is smaller than disk d2 (enforces size constraint)
  )

  ; -------------------------
  ; Agent 1 actions (disk moved must be allowed_agent1)
  ; Two variants for source-behind element type (below is disk or peg),
  ; and two variants for target (target empty or target has top disk).
  ; For brevity the "onto-disk" actions require (smaller ?d ?e).
  ; -------------------------

  ; Move agent_1: move disk from a peg where disk below is another disk, onto an empty peg
  (:action move_agent1_from_disk_onto_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (top ?from ?below)
    )
  )

  ; Move agent_1: move disk from a peg where disk below is a peg (d was bottom) onto an empty peg
  (:action move_agent1_from_peg_onto_empty
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ; Move agent_1: move disk from a peg where disk below is a disk, onto a top disk on target peg (size constraint)
  (:action move_agent1_from_disk_onto_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (top ?from ?below)
    )
  )

  ; Move agent_1: move disk from a peg where disk below is a peg, onto a top disk on target peg (size constraint)
  (:action move_agent1_from_peg_onto_disk
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent1 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (empty ?from)
    )
  )

  ; -------------------------
  ; Agent 2 actions (disk moved must be allowed_agent2)
  ; Mirrored versions for agent_2
  ; -------------------------

  (:action move_agent2_from_disk_onto_empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (top ?from ?below)
    )
  )

  (:action move_agent2_from_peg_onto_empty
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move_agent2_from_disk_onto_disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (top ?from ?below)
    )
  )

  (:action move_agent2_from_peg_onto_disk
    :parameters (?d - disk ?from - peg ?below - peg ?to - peg ?e - disk)
    :precondition (and
      (allowed_agent2 ?d)
      (on ?d ?below)
      (top ?from ?d)
      (top ?to ?e)
      (smaller ?d ?e)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (top ?from ?d))
      (not (top ?to ?e))
      (top ?to ?d)
      (empty ?from)
    )
  )
)