(define (problem meet-deborah-classical)
  (:domain friends-meeting-classical)

  (:objects
    you deborah - person
    castro sunset - location
    t540 t838 t855 t930 t1200 - time
  )

  (:init
    ;; arrival: you at The Castro at 09:00 (540)
    (at you castro t540)
    ;; Deborah is at Sunset at 14:15 (855) (start of her availability)
    (at deborah sunset t855)

    ;; timeline successors (allow waiting/advancing)
    (next t540 t838)
    (next t838 t855)
    (next t855 t930)
    (next t930 t1200)

    ;; travel slots encode 17-minute travel for the traveler (you).
    ;; Leaving castro at 13:58 (838) arrives sunset at 14:15 (855)
    (travel-slot you castro sunset t838 t855)

    ;; meeting slot of length 75 minutes: 14:15 (855) to 15:30 (930)
    (meeting-slot t855 t930)
    ;; Deborah's availability covers this meeting slot (she's available 14:15-20:00;
    ;; here we encode availability for the chosen meeting interval)
    (deborah-available t855 t930)
  )

  (:goal (met deborah))
)