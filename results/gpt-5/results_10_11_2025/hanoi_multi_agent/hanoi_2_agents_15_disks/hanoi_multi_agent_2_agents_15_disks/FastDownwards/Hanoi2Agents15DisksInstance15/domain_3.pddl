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
    (s0) (s1) (s2) (s3) (s4) (s5) (s6) (s7) (s8) (s9)
    (step1-target-l ?d - lightdisk ?topeg - peg)
    (step2-target-l ?d - lightdisk ?topeg - peg)
    (step3-target-l ?d - lightdisk ?to - disk)
    (step4-target-l ?d - lightdisk ?topeg - peg)
    (step5-target-l ?d - lightdisk ?to - disk)
    (step6-target-l ?d - lightdisk ?to - disk)
    (step7-target-l ?d - lightdisk ?to - disk)
    (step8-target-l ?d - lightdisk ?topeg - peg)
    (step9-target-l ?d - lightdisk ?to - disk)
    (step1-target-h ?d - heavydisk ?topeg - peg)
    (step2-target-h ?d - heavydisk ?topeg - peg)
    (step3-target-h ?d - heavydisk ?to - disk)
    (step4-target-h ?d - heavydisk ?topeg - peg)
    (step5-target-h ?d - heavydisk ?to - disk)
    (step6-target-h ?d - heavydisk ?to - disk)
    (step7-target-h ?d - heavydisk ?to - disk)
    (step8-target-h ?d - heavydisk ?topeg - peg)
    (step9-target-h ?d - heavydisk ?to - disk)
  )

  (:action audited-step1-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and (s0) (step1-target-l ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s0)) (s1) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step2-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and (s1) (step2-target-l ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s1)) (s2) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step3-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and (s2) (step3-target-l ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s2)) (s3) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step4-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and (s3) (step4-target-l ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s3)) (s4) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step5-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and (s4) (step5-target-l ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s4)) (s5) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step6-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and (s5) (step6-target-l ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s5)) (s6) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step7-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and (s6) (step7-target-l ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s6)) (s7) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step8-a1
    :parameters (?d - lightdisk ?from - support ?topeg - peg)
    :precondition (and (s7) (step8-target-l ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s7)) (s8) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step9-a1
    :parameters (?d - lightdisk ?from - support ?to - disk)
    :precondition (and (s8) (step9-target-l ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s8)) (s9) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step1-a2
    :parameters (?d - heavydisk ?from - support ?topeg - peg)
    :precondition (and (s0) (step1-target-h ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s0)) (s1) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step2-a2
    :parameters (?d - heavydisk ?from - support ?topeg - peg)
    :precondition (and (s1) (step2-target-h ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s1)) (s2) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step3-a2
    :parameters (?d - heavydisk ?from - support ?to - disk)
    :precondition (and (s2) (step3-target-h ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s2)) (s3) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step4-a2
    :parameters (?d - heavydisk ?from - support ?topeg - peg)
    :precondition (and (s3) (step4-target-h ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s3)) (s4) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step5-a2
    :parameters (?d - heavydisk ?from - support ?to - disk)
    :precondition (and (s4) (step5-target-h ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s4)) (s5) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step6-a2
    :parameters (?d - heavydisk ?from - support ?to - disk)
    :precondition (and (s5) (step6-target-h ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s5)) (s6) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step7-a2
    :parameters (?d - heavydisk ?from - support ?to - disk)
    :precondition (and (s6) (step7-target-h ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s6)) (s7) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action audited-step8-a2
    :parameters (?d - heavydisk ?from - support ?topeg - peg)
    :precondition (and (s7) (step8-target-h ?d ?topeg) (on ?d ?from) (clear ?d) (clear ?topeg))
    :effect (and (not (s7)) (s8) (not (on ?d ?from)) (on ?d ?topeg) (clear ?from) (not (clear ?topeg)))
  )

  (:action audited-step9-a2
    :parameters (?d - heavydisk ?from - support ?to - disk)
    :precondition (and (s8) (step9-target-h ?d ?to) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (s8)) (s9) (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )
)