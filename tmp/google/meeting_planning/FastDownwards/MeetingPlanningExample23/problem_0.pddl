(define (problem combined-meet-problem)
  (:domain combined-meet)
  (:objects bayview russianhill - location)

  ;; Initial facts:
  ;; - Traveler is at Bayview at 09:00 (time = 540)
  ;; - John's availability at RussianHill starts at 17:30 (1050) and ends at 21:00 (1260)
  (:init
    (at bayview)
    (= (time) 540)

    ;; Timed initial literals model John's scheduled presence
    (at 1050 (john-at russianhill))
    (at 1260 (not (john-at russianhill)))
  )

  ;; Goal: meet John (for the 75-minute meeting encoded by the meet actions)
  (:goal (met))
)