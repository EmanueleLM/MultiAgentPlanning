(define (problem schedule-meeting-integrated)
  (:domain meeting-scheduling-combined)

  (:objects
    ;; persons
    joyce christine alexander

    ;; canonical 30-min start slots Monday 09:00-16:30 (= slots for 09:00-17:00 window)
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30

    ;; meeting object (for agent3)
    m1
  )

  (:init
    ;; Declare slots and global within-hours window (Mon 09:00-17:00)
    (slot s_09_00) (slot s_09_30) (slot s_10_00) (slot s_10_30)
    (slot s_11_00) (slot s_11_30) (slot s_12_00) (slot s_12_30)
    (slot s_13_00) (slot s_13_30) (slot s_14_00) (slot s_14_30)
    (slot s_15_00) (slot s_15_30) (slot s_16_00) (slot s_16_30)

    (within-hours s_09_00) (within-hours s_09_30) (within-hours s_10_00) (within-hours s_10_30)
    (within-hours s_11_00) (within-hours s_11_30) (within-hours s_12_00) (within-hours s_12_30)
    (within-hours s_13_00) (within-hours s_13_30) (within-hours s_14_00) (within-hours s_14_30)
    (within-hours s_15_00) (within-hours s_15_30) (within-hours s_16_00) (within-hours s_16_30)

    ;; Agent1: participants and Joyce's known busy intervals (from first agent)
    (participant joyce) (participant christine) (participant alexander)

    ;; Joyce busy per agent1's information:
    ;; busy at 11:00, 13:30, 14:30, 15:00, 15:30, 16:00
    (a1_busy joyce s_11_00)
    (a1_busy joyce s_13_30)
    (a1_busy joyce s_14_30) (a1_busy joyce s_15_00) (a1_busy joyce s_15_30) (a1_busy joyce s_16_00)

    ;; Agent2: Christine and public availability (from second agent)
    ;; Christine busy before 12:00:
    (a2_busy christine s_09_00) (a2_busy christine s_09_30)
    (a2_busy christine s_10_00) (a2_busy christine s_10_30)
    (a2_busy christine s_11_00) (a2_busy christine s_11_30)

    ;; Christine free from 12:00 onward (agent2's knowledge)
    (a2_free christine s_12_00) (a2_free christine s_12_30)
    (a2_free christine s_13_00) (a2_free christine s_13_30)
    (a2_free christine s_14_00) (a2_free christine s_14_30)
    (a2_free christine s_15_00) (a2_free christine s_15_30)
    (a2_free christine s_16_00) (a2_free christine s_16_30)

    ;; Agent2: the public "meeting duration" fact
    (meeting-duration-30)

    ;; Agent2: explicit free facts known (second agent asserted these):
    ;; only explicitly asserted free for Joyce and Alexander at 12:00 in their input
    (a2_free joyce s_12_00)
    (a2_free alexander s_12_00)

    ;; Agent3: Alexander's known busy intervals (from third agent).
    ;; Mapping s0..s15 -> canonical times:
    ;; s0=09:00, s1=09:30, s2=10:00, s3=10:30,
    ;; s4=11:00, s5=11:30, s6=12:00, s7=12:30,
    ;; s8=13:00, s9=13:30, s10=14:00, s11=14:30,
    ;; s12=15:00, s13=15:30, s14=16:00, s15=16:30
    ;; alexander busy per agent3:
    ;; 09:00-11:00 => s_09_00, s_09_30, s_10_00, s_10_30
    (a3_busy alexander s_09_00) (a3_busy alexander s_09_30)
    (a3_busy alexander s_10_00) (a3_busy alexander s_10_30)
    ;; alexander busy 12:00-12:30 => s_12_00
    (a3_busy alexander s_12_00)
    ;; alexander busy 13:30-15:00 => s_13_30, s_14_00, s_14_30
    (a3_busy alexander s_13_30) (a3_busy alexander s_14_00) (a3_busy alexander s_14_30)
    ;; alexander busy 15:30-16:00 => s_15_30
    (a3_busy alexander s_15_30)
    ;; alexander busy 16:30-17:00 => s_16_30
    (a3_busy alexander s_16_30)

    ;; Agent3: meeting object
    (meeting m1)
  )

  ;; Goal:
  ;; We require a consistent schedule that respects the integrated constraints:
  ;; - agent3 records the meeting m1 at the chosen slot (this action also records all three participants)
  ;; - agent1 also records the same slot as scheduled from its perspective
  ;; (This ensures the chosen slot respects agent1's Joyce constraints and agent3's Alexander constraints;
  ;; agent2's known frees for Christine are also satisfied by the chosen slot below.)
  (:goal (and
    (a3_scheduled m1 s_12_30)
    (a1_scheduled s_12_30)
  ))
)