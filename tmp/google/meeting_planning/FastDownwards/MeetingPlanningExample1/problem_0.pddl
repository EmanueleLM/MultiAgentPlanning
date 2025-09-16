(define (problem meeting-problem-two-agents)
  (:domain betty-meet-two-agents)

  ; No explicit objects section is needed if constants are used in the domain.
  ; The domain defines constants: you, betty (agents) and Richmond, Financial (locations).

  (:init
     (at you Richmond)      ; You start at Richmond
     (at betty Financial)   ; Betty starts at Financial
     (= (time) 540)          ; Start at 09:00 (540 minutes after midnight)
  )

  (:goal (met))
)