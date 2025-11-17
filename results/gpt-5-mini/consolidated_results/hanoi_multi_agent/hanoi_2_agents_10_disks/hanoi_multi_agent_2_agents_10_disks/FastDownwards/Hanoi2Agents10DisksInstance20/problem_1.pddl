(define (problem Hanoi2Agents10DisksInstance20)
  (:domain hanoi2agents_hardcoded)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 - step
  )

  (:init
    ;; initial stack on 'left' top -> bottom: A B C D E F G H I J
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; size ordering: A smallest, J largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ;; start at step0
    (at-step step0)
  )

  (:goal (and
    ;; left top->bottom = B, E, F, G, H, I, J
    (on B left)
    (on E B)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; middle top->bottom = A
    (on A middle)

    ;; right top->bottom = C, D
    (on C right)
    (on D C)
  ))
)