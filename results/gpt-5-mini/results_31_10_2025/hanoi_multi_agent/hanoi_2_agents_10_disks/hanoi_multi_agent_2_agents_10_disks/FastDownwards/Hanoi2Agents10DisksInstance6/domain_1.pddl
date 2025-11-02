(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
          disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)     ; disk d is directly on place p (a disk or a peg)
    (clear ?p - place)           ; there is no disk on top of place p
    (smaller ?d1 - disk ?d2 - disk) ; static: d1 is smaller than d2
  )

  ;--------- Actions for agent_1 (may move A-E) ----------
  ; Move disk X from some place ?from to an empty peg ?to (peg must be empty)
  ; and Move disk X from some place ?from to a top disk ?to (must be larger than X)

  ; Agent 1 actions for disk A
  (:action agent_1_move_A_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on A ?from) (clear A) (clear ?to))
    :effect (and
              (not (on A ?from)) (on A ?to)
              (clear ?from) (not (clear ?to))
              (clear A)
            )
  )
  (:action agent_1_move_A_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on A ?from) (clear A) (clear ?to) (smaller A ?to))
    :effect (and
              (not (on A ?from)) (on A ?to)
              (clear ?from) (not (clear ?to))
              (clear A)
            )
  )

  ; Agent 1 actions for disk B
  (:action agent_1_move_B_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on B ?from) (clear B) (clear ?to))
    :effect (and
              (not (on B ?from)) (on B ?to)
              (clear ?from) (not (clear ?to))
              (clear B)
            )
  )
  (:action agent_1_move_B_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on B ?from) (clear B) (clear ?to) (smaller B ?to))
    :effect (and
              (not (on B ?from)) (on B ?to)
              (clear ?from) (not (clear ?to))
              (clear B)
            )
  )

  ; Agent 1 actions for disk C
  (:action agent_1_move_C_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on C ?from) (clear C) (clear ?to))
    :effect (and
              (not (on C ?from)) (on C ?to)
              (clear ?from) (not (clear ?to))
              (clear C)
            )
  )
  (:action agent_1_move_C_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on C ?from) (clear C) (clear ?to) (smaller C ?to))
    :effect (and
              (not (on C ?from)) (on C ?to)
              (clear ?from) (not (clear ?to))
              (clear C)
            )
  )

  ; Agent 1 actions for disk D
  (:action agent_1_move_D_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on D ?from) (clear D) (clear ?to))
    :effect (and
              (not (on D ?from)) (on D ?to)
              (clear ?from) (not (clear ?to))
              (clear D)
            )
  )
  (:action agent_1_move_D_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on D ?from) (clear D) (clear ?to) (smaller D ?to))
    :effect (and
              (not (on D ?from)) (on D ?to)
              (clear ?from) (not (clear ?to))
              (clear D)
            )
  )

  ; Agent 1 actions for disk E
  (:action agent_1_move_E_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on E ?from) (clear E) (clear ?to))
    :effect (and
              (not (on E ?from)) (on E ?to)
              (clear ?from) (not (clear ?to))
              (clear E)
            )
  )
  (:action agent_1_move_E_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on E ?from) (clear E) (clear ?to) (smaller E ?to))
    :effect (and
              (not (on E ?from)) (on E ?to)
              (clear ?from) (not (clear ?to))
              (clear E)
            )
  )

  ;--------- Actions for agent_2 (may move F-J) ----------
  ; For completeness model agent_2 moves for disks F-J (same schema but agent_2 prefix)

  ; Agent 2 actions for disk F
  (:action agent_2_move_F_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on F ?from) (clear F) (clear ?to))
    :effect (and
              (not (on F ?from)) (on F ?to)
              (clear ?from) (not (clear ?to))
              (clear F)
            )
  )
  (:action agent_2_move_F_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on F ?from) (clear F) (clear ?to) (smaller F ?to))
    :effect (and
              (not (on F ?from)) (on F ?to)
              (clear ?from) (not (clear ?to))
              (clear F)
            )
  )

  ; Agent 2 actions for disk G
  (:action agent_2_move_G_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on G ?from) (clear G) (clear ?to))
    :effect (and
              (not (on G ?from)) (on G ?to)
              (clear ?from) (not (clear ?to))
              (clear G)
            )
  )
  (:action agent_2_move_G_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on G ?from) (clear G) (clear ?to) (smaller G ?to))
    :effect (and
              (not (on G ?from)) (on G ?to)
              (clear ?from) (not (clear ?to))
              (clear G)
            )
  )

  ; Agent 2 actions for disk H
  (:action agent_2_move_H_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on H ?from) (clear H) (clear ?to))
    :effect (and
              (not (on H ?from)) (on H ?to)
              (clear ?from) (not (clear ?to))
              (clear H)
            )
  )
  (:action agent_2_move_H_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on H ?from) (clear H) (clear ?to) (smaller H ?to))
    :effect (and
              (not (on H ?from)) (on H ?to)
              (clear ?from) (not (clear ?to))
              (clear H)
            )
  )

  ; Agent 2 actions for disk I
  (:action agent_2_move_I_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on I ?from) (clear I) (clear ?to))
    :effect (and
              (not (on I ?from)) (on I ?to)
              (clear ?from) (not (clear ?to))
              (clear I)
            )
  )
  (:action agent_2_move_I_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on I ?from) (clear I) (clear ?to) (smaller I ?to))
    :effect (and
              (not (on I ?from)) (on I ?to)
              (clear ?from) (not (clear ?to))
              (clear I)
            )
  )

  ; Agent 2 actions for disk J
  (:action agent_2_move_J_to_peg
    :parameters (?from - place ?to - peg)
    :precondition (and (on J ?from) (clear J) (clear ?to))
    :effect (and
              (not (on J ?from)) (on J ?to)
              (clear ?from) (not (clear ?to))
              (clear J)
            )
  )
  (:action agent_2_move_J_onto_disk
    :parameters (?from - place ?to - disk)
    :precondition (and (on J ?from) (clear J) (clear ?to) (smaller J ?to))
    :effect (and
              (not (on J ?from)) (on J ?to)
              (clear ?from) (not (clear ?to))
              (clear J)
            )
  )

)