(define (problem combined-meeting-problem)
  (:domain combined-meeting)
  (:objects
    visitor kenneth - agent
    fishermans_wharf nob_hill - location
  )
  (:init
    ;; Both start at Fishermans Wharf at 9:00 AM (clock = 0 minutes since 9:00)
    (at visitor fishermans_wharf)
    (at kenneth fishermans_wharf)
    (= (clock) 0)

    ;; Road connectivity (symmetric)
    (road fishermans_wharf nob_hill)
    (road nob_hill fishermans_wharf)
  )
  (:goal (met))
  (:metric minimize (clock))
)