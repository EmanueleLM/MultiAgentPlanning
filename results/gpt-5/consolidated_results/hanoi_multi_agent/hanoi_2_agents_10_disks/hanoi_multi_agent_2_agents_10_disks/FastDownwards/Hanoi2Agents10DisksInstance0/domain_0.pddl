(define (domain hanoi-two-agent-ordered)
  (:requirements :strips :typing)
  (:types
    agent
    support
    disk peg - support
  )

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
    (s1) (s2) (s3) (s4) (s5) (s6) (s7) (s8) (s9) (s10) (s11) (s12)
  )

  ; Step 1: A from B to right (onto peg)
  (:action step1-move-a-b-to-right
    :parameters (?ag - agent)
    :precondition (and
      (s1)
      (controls ?ag a)
      (on a b)
      (clear a)
      (clear right)
    )
    :effect (and
      (not (on a b))
      (on a right)
      (clear b)
      (not (clear right))
      (not (s1))
      (s2)
    )
  )

  ; Step 2: B from C to middle (onto peg)
  (:action step2-move-b-c-to-middle
    :parameters (?ag - agent)
    :precondition (and
      (s2)
      (controls ?ag b)
      (on b c)
      (clear b)
      (clear middle)
    )
    :effect (and
      (not (on b c))
      (on b middle)
      (clear c)
      (not (clear middle))
      (not (s2))
      (s3)
    )
  )

  ; Step 3: A from right to B (onto disk)
  (:action step3-move-a-right-to-b
    :parameters (?ag - agent)
    :precondition (and
      (s3)
      (controls ?ag a)
      (on a right)
      (clear a)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a right))
      (on a b)
      (clear right)
      (not (clear b))
      (not (s3))
      (s4)
    )
  )

  ; Step 4: C from D to right (onto peg)
  (:action step4-move-c-d-to-right
    :parameters (?ag - agent)
    :precondition (and
      (s4)
      (controls ?ag c)
      (on c d)
      (clear c)
      (clear right)
    )
    :effect (and
      (not (on c d))
      (on c right)
      (clear d)
      (not (clear right))
      (not (s4))
      (s5)
    )
  )

  ; Step 5: A from B to D (onto disk)
  (:action step5-move-a-b-to-d
    :parameters (?ag - agent)
    :precondition (and
      (s5)
      (controls ?ag a)
      (on a b)
      (clear a)
      (clear d)
      (smaller a d)
    )
    :effect (and
      (not (on a b))
      (on a d)
      (clear b)
      (not (clear d))
      (not (s5))
      (s6)
    )
  )

  ; Step 6: B from middle to C (onto disk)
  (:action step6-move-b-middle-to-c
    :parameters (?ag - agent)
    :precondition (and
      (s6)
      (controls ?ag b)
      (on b middle)
      (clear b)
      (clear c)
      (smaller b c)
    )
    :effect (and
      (not (on b middle))
      (on b c)
      (clear middle)
      (not (clear c))
      (not (s6))
      (s7)
    )
  )

  ; Step 7: A from D to B (onto disk)
  (:action step7-move-a-d-to-b
    :parameters (?ag - agent)
    :precondition (and
      (s7)
      (controls ?ag a)
      (on a d)
      (clear a)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a d))
      (on a b)
      (clear d)
      (not (clear b))
      (not (s7))
      (s8)
    )
  )

  ; Step 8: D from E to middle (onto peg)
  (:action step8-move-d-e-to-middle
    :parameters (?ag - agent)
    :precondition (and
      (s8)
      (controls ?ag d)
      (on d e)
      (clear d)
      (clear middle)
    )
    :effect (and
      (not (on d e))
      (on d middle)
      (clear e)
      (not (clear middle))
      (not (s8))
      (s9)
    )
  )

  ; Step 9: A from B to E (onto disk)
  (:action step9-move-a-b-to-e
    :parameters (?ag - agent)
    :precondition (and
      (s9)
      (controls ?ag a)
      (on a b)
      (clear a)
      (clear e)
      (smaller a e)
    )
    :effect (and
      (not (on a b))
      (on a e)
      (clear b)
      (not (clear e))
      (not (s9))
      (s10)
    )
  )

  ; Step 10: B from C to D (onto disk)
  (:action step10-move-b-c-to-d
    :parameters (?ag - agent)
    :precondition (and
      (s10)
      (controls ?ag b)
      (on b c)
      (clear b)
      (clear d)
      (smaller b d)
    )
    :effect (and
      (not (on b c))
      (on b d)
      (clear c)
      (not (clear d))
      (not (s10))
      (s11)
    )
  )

  ; Step 11: A from E to C (onto disk)
  (:action step11-move-a-e-to-c
    :parameters (?ag - agent)
    :precondition (and
      (s11)
      (controls ?ag a)
      (on a e)
      (clear a)
      (clear c)
      (smaller a c)
    )
    :effect (and
      (not (on a e))
      (on a c)
      (clear e)
      (not (clear c))
      (not (s11))
      (s12)
    )
  )
)