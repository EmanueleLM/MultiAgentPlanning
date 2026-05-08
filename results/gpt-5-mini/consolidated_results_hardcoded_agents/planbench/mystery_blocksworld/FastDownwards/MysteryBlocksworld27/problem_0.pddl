(define (problem assembly-problem-1)
  (:domain staged-assembly)
  (:objects
    ; agents
    carrier1 assembler1 inspector1 auditor1 - agent

    ; parts
    part1 - part

    ; locations
    supplier assembly testbench office delivery - location

    ; phases
    p_prepare p_assemble p_test p_approve p_deliver - phase
  )

  (:init
    ; initial locations of agents
    (at carrier1 supplier)
    (at assembler1 assembly)
    (at inspector1 testbench)
    (at auditor1 office)

    ; initial part location
    (part-at part1 supplier)

    ; phase linkage and initial active phase
    (phase-next p_prepare p_assemble)
    (phase-next p_assemble p_test)
    (phase-next p_test p_approve)
    (phase-next p_approve p_deliver)

    (phase-active p_prepare)
  )

  ; Goals: all mandatory terminal conditions must be true and phases progressed to delivery.
  (:goal (and
    (assembled part1)
    (tested part1)
    (approved part1)
    (delivered part1)
    (part-at part1 delivery)
    (phase-active p_deliver)
  ))