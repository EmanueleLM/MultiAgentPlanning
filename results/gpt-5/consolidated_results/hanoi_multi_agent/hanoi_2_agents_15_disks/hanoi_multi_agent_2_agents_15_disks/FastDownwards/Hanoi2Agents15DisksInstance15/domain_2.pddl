(define (domain hanoi2agents-ordered)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
    lightdisk - disk
    heavydisk - disk
  )

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)

    ; ordered stage flags
    (s0) (s1) (s2) (s3) (s4) (s5) (s6) (s7) (s8) (s9)

    ; audited move targets (bind exact objects per step in the problem)
    (step1-target ?d - lightdisk ?topeg - peg)
    (step2-target ?d - lightdisk ?topeg - peg)
    (step3-target ?d - lightdisk ?to - disk)
    (step4-target ?d - lightdisk ?topeg - peg)
    (step5-target ?d - lightdisk ?to - disk)
    (step6-target ?d - lightdisk ?to - disk)
    (step7-target ?d - lightdisk ?to - disk)
    (step8-target ?d - lightdisk ?topeg - peg)
    (step9-target ?d - lightdisk ?to - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Audited, ordered moves (agent_1 only). These enforce the exact sequence.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; 1) agent_1: move disk A to middle
  (:action audited-step1-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and
      (s0)
      (step1-target ?d ?topeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s0)) (s1)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
    )
  )

  ; 2) agent_1: move disk B to right
  (:action audited-step2-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and
      (s1)
      (step2-target ?d ?topeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s1)) (s2)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
    )
  )

  ; 3) agent_1: move disk A onto B
  (:action audited-step3-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and
      (s2)
      (step3-target ?d ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (s2)) (s3)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; 4) agent_1: move disk C to middle
  (:action audited-step4-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and
      (s3)
      (step4-target ?d ?topeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s3)) (s4)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
    )
  )

  ; 5) agent_1: move disk A onto D
  (:action audited-step5-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and
      (s4)
      (step5-target ?d ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (s4)) (s5)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; 6) agent_1: move disk B onto C
  (:action audited-step6-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and
      (s5)
      (step6-target ?d ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (s5)) (s6)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; 7) agent_1: move disk A onto B
  (:action audited-step7-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and
      (s6)
      (step7-target ?d ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (s6)) (s7)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; 8) agent_1: move disk D to right
  (:action audited-step8-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and
      (s7)
      (step8-target ?d ?topeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s7)) (s8)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
    )
  )

  ; 9) agent_1: move disk A onto E
  (:action audited-step9-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and
      (s8)
      (step9-target ?d ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (s8)) (s9)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)