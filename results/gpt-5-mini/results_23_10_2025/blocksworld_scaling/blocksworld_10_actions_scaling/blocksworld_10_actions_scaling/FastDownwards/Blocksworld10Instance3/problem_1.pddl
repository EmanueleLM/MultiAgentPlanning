(define (problem Blocksworld10Instance3-problem)
  (:domain Blocksworld10Instance3)
  (:objects
    A B C D E F - block
    mover_alpha mover_beta orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:init
    ;; initial "on" and "ontable" facts (as given)
    (on A E)
    (on E F)
    (on F D)
    (ontable B)
    (ontable C)
    (ontable D)

    ;; initial clear status
    (clear A)    ;; top of the A-E-F-D stack initially
    (not-clear E) ;; placeholder to explain reasoning: will instead assert not clear by omitting (clear E)
    ;; PDDL does not allow "not" in init; we express only positive facts.
    ;; So we assert positive clears and leave absent facts as false.
    ;; Positive clears:
    (clear B)
    (clear C)
    ;; E, F, D are not declared clear here (so implicitly not clear)

    ;; Agent hand status and global single-carry constraint
    (handempty mover_alpha)
    (handempty mover_beta)
    (handempty orchestrator)
    (nobody-holding)

    ;; starting step marker
    (current s0)
  )

  ;; Note: some planners require only positive init facts; we relied on absence
  ;; of (clear E), (clear F), (clear D) to indicate they are not clear initially.

  (:goal (and (current s10)))
)