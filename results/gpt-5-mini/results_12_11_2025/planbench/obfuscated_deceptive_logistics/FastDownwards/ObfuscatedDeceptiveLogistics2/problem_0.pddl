(define (problem orchestrate-workflow)
  (:domain orchestration-domain)

  (:objects
    ;; Agents
    analyzer - agent
    proposer - agent
    auditor - agent

    ;; Tasks
    analyze-task propose-task audit-task integrate-task - task

    ;; Days (explicit discrete timeline)
    d1 d2 d3 d4 - day
  )

  (:init
    ;; Days and their contiguity (explicit sequence)
    (is-day d1) (is-day d2) (is-day d3) (is-day d4)
    (day-first d1)
    (day-successor d1 d2)
    (day-successor d2 d3)
    (day-successor d3 d4)

    ;; Capabilities (preserve which agent contributes which fragment)
    ; Analyzer model contribution
    (can-perform analyzer analyze-task)

    ; Proposer fragments contribution
    (can-perform proposer propose-task)
    (can-perform proposer integrate-task)  ; proposer will perform integration

    ; Auditor corrections contribution
    (can-perform auditor audit-task)

    ;; No tasks are completed initially; no proposal-corrected; no finalized
  )

  ;; Goals: all mandated terminal conditions fixed.
  ;; Enforce that each task is completed on the specific sequential day:
  ;; analyze -> d1, propose -> d2, audit -> d3, integrate -> d4
  (:goal
    (and
      (completed analyze-task)
      (completed propose-task)
      (completed audit-task)
      (completed integrate-task)
      (completed-on analyze-task d1)
      (completed-on propose-task d2)
      (completed-on audit-task d3)
      (completed-on integrate-task d4)
      (proposal-corrected)
      (finalized)
    )
  )
)