(define (problem monday-0900-1700-meeting)
  (:domain meeting-scheduler)
  (:objects
    alexander elizabeth walter - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ; Alexander free slots
    (free alexander s0900)
    (free alexander s1000)
    (free alexander s1100)
    (free alexander s1130)
    (free alexander s1200)
    (free alexander s1300)
    (free alexander s1330)
    (free alexander s1400)
    (free alexander s1500)
    (free alexander s1530)

    ; Elizabeth free slots
    (free elizabeth s0930)
    (free elizabeth s1000)
    (free elizabeth s1030)
    (free elizabeth s1100)
    (free elizabeth s1230)
    (free elizabeth s1430)
    (free elizabeth s1500)
    (free elizabeth s1530)
    (free elizabeth s1600)
    (free elizabeth s1630)

    ; Walter free slots
    (free walter s1430)
    (free walter s1500)

    ; Slots available for all participants
    (available-for-all s1500)
  )
  (:goal
    (and (scheduled))
  )
)