(define (domain orchestrator-domain)
  (:requirements :typing :negative-preconditions :strips)
  (:types agent doc phase task)

  (:constants
    orchestrator analyst auditor - agent
    analysis audit_report public_info private_info integrated_report - doc
    phase1 phase2 phase3 phase4 phase5 - phase
    paltry_task sip_task clip_task wretched_task memory_task tightfisted_task objects_task - task
  )

  (:predicates
    (phase-active ?p - phase)
    (next ?p1 - phase ?p2 - phase)              ; explicit successor links for contiguity
    (has ?a - agent ?d - doc)                   ; agent possesses document
    (reviewed ?d - doc)                         ; document reviewed by orchestrator
    (integrated ?d - doc)                       ; integrated document produced
    (contains ?d - doc ?sub - doc)              ; d contains sub-document
    (corrected ?d - doc)                        ; corrections applied
    (archived ?d - doc)                         ; document archived
    (sealed ?d - doc)                           ; document sealed for confidentiality
    (confidential ?d - doc)                     ; document is confidential (private)
    (published ?d - doc)                        ; document published to public
    (global-goal ?g - task)                     ; global goal marker (informational)
  )

  ;; Review analysis (paltry) - orchestrator reviews the analyst's analysis in phase1
  (:action paltry
    :precondition (and
      (phase-active phase1)
      (has orchestrator analysis)
      (not (reviewed analysis))
    )
    :effect (and
      (reviewed analysis)
    )
  )

  ;; Review audit report (sip) - orchestrator reviews the auditor's report in phase1
  (:action sip
    :precondition (and
      (phase-active phase1)
      (has orchestrator audit_report)
      (not (reviewed audit_report))
    )
    :effect (and
      (reviewed audit_report)
    )
  )

  ;; Move from intake (phase1) to integration (phase2); requires both reviews completed
  ;; (clip acts as the phase-advance action enforcing the ordered sequence)
  (:action clip
    :precondition (and
      (phase-active phase1)
      (reviewed analysis)
      (reviewed audit_report)
    )
    :effect (and
      (not (phase-active phase1))
      (phase-active phase2)
    )
  )

  ;; Integrate reviewed documents into the integrated_report in phase2, then advance to phase3
  ;; (wretched performs integration; it explicitly includes analysis, audit_report, and public_info;
  ;; it must not include private_info because no action ever adds that containment)
  (:action wretched
    :precondition (and
      (phase-active phase2)
      (reviewed analysis)
      (reviewed audit_report)
      (not (integrated integrated_report))
    )
    :effect (and
      (integrated integrated_report)
      (contains integrated_report analysis)
      (contains integrated_report audit_report)
      (contains integrated_report public_info)
      (not (phase-active phase2))
      (phase-active phase3)
    )
  )

  ;; Seal private information to enforce confidentiality before archive/publish; advance to phase4.
  ;; This action requires that the integrated report does not contain the private_info (hard constraint
  ;; encoded by forbidding containment by precondition). Only orchestrator may seal its private info.
  (:action tightfisted
    :precondition (and
      (phase-active phase3)
      (has orchestrator private_info)
      (confidential private_info)
      (not (sealed private_info))
      (not (contains integrated_report private_info))
    )
    :effect (and
      (sealed private_info)
      (not (phase-active phase3))
      (phase-active phase4)
    )
  )

  ;; Archive the integrated report in phase4 and advance to publish phase5 (memory action)
  (:action memory
    :precondition (and
      (phase-active phase4)
      (integrated integrated_report)
      (sealed private_info)
      (not (archived integrated_report))
    )
    :effect (and
      (archived integrated_report)
      (not (phase-active phase4))
      (phase-active phase5)
    )
  )

  ;; Publish the archived, sealed integrated report in phase5 (objects action).
  ;; Publishing is disallowed unless the private_info has been sealed and the report archived.
  (:action objects
    :precondition (and
      (phase-active phase5)
      (archived integrated_report)
      (sealed private_info)
      (not (published integrated_report))
    )
    :effect (and
      (published integrated_report)
    )
  )
)