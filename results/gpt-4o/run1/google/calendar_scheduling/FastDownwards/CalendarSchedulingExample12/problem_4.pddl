(define (problem schedule_meeting_instance)
  (:domain scheduling_meetings)
  (:objects
    david debra kevin - participant
    slot_0900_1000 slot_1000_1100 slot_1100_1200 slot_1200_1300
    slot_1300_1400 slot_1400_1500 slot_1500_1600 slot_1600_1700 - time_slot)
  
  (:init
    ; David's availability
    (available david slot_0900_1000)
    (available david slot_1000_1100)
    (available david slot_1100_1200)
    (available david slot_1200_1300)
    (available david slot_1300_1400)
    (available david slot_1400_1500)
    (available david slot_1500_1600)
    (available david slot_1600_1700)
    
    ; Debra's availability
    (available debra slot_0900_1000)
    (available debra slot_1000_1100)
    (available debra slot_1100_1200)
    (available debra slot_1300_1400)
    (available debra slot_1400_1500)
    (available debra slot_1500_1600)
    (available debra slot_1600_1700)
    
    ; Kevin's availability
    (available kevin slot_1200_1300)
    (available kevin slot_1300_1400)
    (available kevin slot_1500_1600))
  
  (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)