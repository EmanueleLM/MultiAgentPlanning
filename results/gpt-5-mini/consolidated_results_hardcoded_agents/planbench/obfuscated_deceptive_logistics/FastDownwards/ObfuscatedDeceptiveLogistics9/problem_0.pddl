(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    observer reasoner auditor - agent
    day1 day2 day3 - day
    collect analyze remediate - task
  )

  (:init
    ;; start on day1
    (current-day day1)

    ;; explicit successive day links (enforce contiguity)
    (successor day1 day2)
    (successor day2 day3)
  )

  ;; Goal fixes every mandated terminal condition:
  ;; - each task completed
  ;; - each task performed by the specified agent
  ;; - timeline finished on day3
  (:goal
    (and
      (done collect)
      (performed-by collect observer)

      (done analyze)
      (performed-by analyze reasoner)

      (done remediate)
      (performed-by remediate auditor)

      (current-day day3)
    )
  )
)