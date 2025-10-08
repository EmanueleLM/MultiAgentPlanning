(define (problem multi-agent-meeting-problem)
  (:domain multi-agent-meeting)
  (:objects s0900_1000 s1000_1100 s1100_1200 s1200_1300 s1300_1400 s1400_1500 s1500_1600 s1600_1700 - Slot)

  ;; Initial state: available facts per agent (based on the provided schedules)
  (:init
     ; Michelle is available in all slots except 11:00-12:00
     (available michelle s0900_1000)
     (available michelle s1000_1100)
     (available michelle s1200_1300)
     (available michelle s1300_1400)
     (available michelle s1400_1500)
     (available michelle s1500_1600)
     (available michelle s1600_1700)

     ; Steven is unavailable in 09:00-09:30, 11:30-12:00, 13:30-14:00, 15:30-16:00
     (available steven s1000_1100)
     (available steven s1200_1300)
     (available steven s1400_1500)
     (available steven s1600_1700)

     ; Jerry has the following blocks: 09:00-09:30, 10:00-11:00, 11:30-12:30, 13:00-14:30, 15:30-16:00, 16:30-17:00
     ; Therefore, Jerry is unavailable in all 60-min slots; hence no (availableJerry ?slot) facts are provided here.

  )

  ; Goal: schedule a 60-minute meeting in one of the slots
  (:goal
     (or (scheduled s0900_1000)
         (scheduled s1000_1100)
         (scheduled s1100_1200)
         (scheduled s1200_1300)
         (scheduled s1300_1400)
         (scheduled s1400_1500)
         (scheduled s1500_1600)
         (scheduled s1600_1700))
  )
)