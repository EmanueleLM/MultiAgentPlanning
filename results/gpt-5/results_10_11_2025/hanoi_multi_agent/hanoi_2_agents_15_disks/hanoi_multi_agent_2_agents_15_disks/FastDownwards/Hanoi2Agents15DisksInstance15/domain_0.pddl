(define (domain hanoi-multiagent-audited)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
    lightdisk - disk
    heavydisk - disk
  )
  (:predicates
    ; core Tower of Hanoi predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (peg ?p - peg)

    ; which peg a disk is currently on (used to relate disks to pegs without transitive closure)
    (at ?d - disk ?p - peg)

    ; audited step progress flags (0-9)
    (s0)
    (s1)
    (s2)
    (s3)
    (s4)
    (s5)
    (s6)
    (s7)
    (s8)
    (s9)

    ; audited move targets (bind exact objects per step in the problem)
    (step1-target ?d - lightdisk ?frompeg - peg ?topeg - peg)
    (step2-target ?d - lightdisk ?frompeg - peg ?topeg - peg)
    (step3-target ?d - lightdisk ?frompeg - peg ?topeg - peg ?td - disk)
    (step4-target ?d - lightdisk ?frompeg - peg ?topeg - peg)
    (step5-target ?d - lightdisk ?frompeg - peg ?topeg - peg ?td - disk)
    (step6-target ?d - lightdisk ?frompeg - peg ?topeg - peg ?td - disk)
    (step7-target ?d - lightdisk ?frompeg - peg ?topeg - peg ?td - disk)
    (step8-target ?d - lightdisk ?frompeg - peg ?topeg - peg)
    (step9-target ?d - lightdisk ?frompeg - peg ?topeg - peg ?td - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Generic move actions (available only after audited sequence completes)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action a1-move-to-peg
    :parameters (?d - lightdisk ?from - support ?to - peg)
    :precondition (and
      (s9)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?to)
    )
  )

  (:action a1-move-onto-disk
    :parameters (?d - lightdisk ?from - support ?to - disk ?p - peg)
    :precondition (and
      (s9)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?to ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?p)
    )
  )

  (:action a2-move-to-peg
    :parameters (?d - heavydisk ?from - support ?to - peg)
    :precondition (and
      (s9)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?to)
    )
  )

  (:action a2-move-onto-disk
    :parameters (?d - heavydisk ?from - support ?to - disk ?p - peg)
    :precondition (and
      (s9)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?to ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?p)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Audited, ordered moves (agent_1 only). These enforce the exact sequence.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; 1) agent_1: move disk A from left to middle
  (:action audited-step1-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg)
    :precondition (and
      (s0)
      (step1-target ?d ?frompeg ?topeg)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s0))
      (s1)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 2) agent_1: move disk B from left to right
  (:action audited-step2-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg)
    :precondition (and
      (s1)
      (step2-target ?d ?frompeg ?topeg)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s1))
      (s2)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 3) agent_1: move disk A from middle to right (onto B)
  (:action audited-step3-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg ?td - disk)
    :precondition (and
      (s2)
      (step3-target ?d ?frompeg ?topeg ?td)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at ?td ?topeg)
    )
    :effect (and
      (not (s2))
      (s3)
      (not (on ?d ?from))
      (on ?d ?td)
      (clear ?from)
      (not (clear ?td))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 4) agent_1: move disk C from left to middle
  (:action audited-step4-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg)
    :precondition (and
      (s3)
      (step4-target ?d ?frompeg ?topeg)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s3))
      (s4)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 5) agent_1: move disk A from right to left (onto D)
  (:action audited-step5-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg ?td - disk)
    :precondition (and
      (s4)
      (step5-target ?d ?frompeg ?topeg ?td)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at ?td ?topeg)
    )
    :effect (and
      (not (s4))
      (s5)
      (not (on ?d ?from))
      (on ?d ?td)
      (clear ?from)
      (not (clear ?td))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 6) agent_1: move disk B from right to middle (onto C)
  (:action audited-step6-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg ?td - disk)
    :precondition (and
      (s5)
      (step6-target ?d ?frompeg ?topeg ?td)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at ?td ?topeg)
    )
    :effect (and
      (not (s5))
      (s6)
      (not (on ?d ?from))
      (on ?d ?td)
      (clear ?from)
      (not (clear ?td))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 7) agent_1: move disk A from left to middle (onto B)
  (:action audited-step7-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg ?td - disk)
    :precondition (and
      (s6)
      (step7-target ?d ?frompeg ?topeg ?td)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at ?td ?topeg)
    )
    :effect (and
      (not (s6))
      (s7)
      (not (on ?d ?from))
      (on ?d ?td)
      (clear ?from)
      (not (clear ?td))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 8) agent_1: move disk D from left to right
  (:action audited-step8-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg)
    :precondition (and
      (s7)
      (step8-target ?d ?frompeg ?topeg)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?topeg)
    )
    :effect (and
      (not (s7))
      (s8)
      (not (on ?d ?from))
      (on ?d ?topeg)
      (clear ?from)
      (not (clear ?topeg))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )

  ; 9) agent_1: move disk A from middle to left (onto E)
  (:action audited-step9-a1
    :parameters (?d - lightdisk ?from - support ?frompeg - peg ?topeg - peg ?td - disk)
    :precondition (and
      (s8)
      (step9-target ?d ?frompeg ?topeg ?td)
      (at ?d ?frompeg)
      (on ?d ?from)
      (clear ?d)
      (clear ?td)
      (smaller ?d ?td)
      (at ?td ?topeg)
    )
    :effect (and
      (not (s8))
      (s9)
      (not (on ?d ?from))
      (on ?d ?td)
      (clear ?from)
      (not (clear ?td))
      (not (at ?d left))
      (not (at ?d middle))
      (not (at ?d right))
      (at ?d ?topeg)
    )
  )
)