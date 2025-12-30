(define (problem CALENDAR-SCHEDULING-FINDER)
    (:domain CALENDAR-SCHEDULER)
    (:objects
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 - time_point
        S0 S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 - slot
    )
    (:init
        ; --- Temporal Setup (T0=9:00, T16=17:00, 30 min increments) ---
        (is-successor T0 T1) (is-successor T1 T2) (is-successor T2 T3) (is-successor T3 T4)
        (is-successor T4 T5) (is-successor T5 T6) (is-successor T6 T7) (is-successor T7 T8)
        (is-successor T8 T9) (is-successor T9 T10) (is-successor T10 T11) (is-successor T11 T12)
        (is-successor T12 T13) (is-successor T13 T14) (is-successor T14 T15) (is-successor T15 T16)

        ; --- Slot Definitions (Start T_i, End T_{i+2}) ---
        (slot-starts-at S0 T0) (slot-ends-at S0 T2) 
        (slot-starts-at S1 T1) (slot-ends-at S1 T3) 
        (slot-starts-at S2 T2) (slot-ends-at S2 T4) 
        (slot-starts-at S3 T3) (slot-ends-at S3 T5)
        (slot-starts-at S4 T4) (slot-ends-at S4 T6) 
        (slot-starts-at S5 T5) (slot-ends-at S5 T7) 
        (slot-starts-at S6 T6) (slot-ends-at S6 T8) 
        (slot-starts-at S7 T7) (slot-ends-at S7 T9)
        (slot-starts-at S8 T8) (slot-ends-at S8 T10) 
        (slot-starts-at S9 T9) (slot-ends-at S9 T11) 
        (slot-starts-at S10 T10) (slot-ends-at S10 T12) 
        (slot-starts-at S11 T11) (slot-ends-at S11 T13)
        (slot-starts-at S12 T12) (slot-ends-at S12 T14) 
        (slot-starts-at S13 T13) (slot-ends-at S13 T15) 
        (slot-starts-at S14 T14) (slot-ends-at S14 T16)

        ; --- Anthony's Schedule (9:30-10:00 [T1], 12:00-13:00 [T6, T7], 16:00-16:30 [T14]) ---
        (busy-Anthony T1) 
        (busy-Anthony T6) (busy-Anthony T7) 
        (busy-Anthony T14)

        ; --- Pamela's Schedule (9:30-10:00 [T1], 16:30-17:00 [T15]) ---
        (busy-Pamela T1) 
        (busy-Pamela T15)

        ; --- Pamela's Preference: Meeting must not occur AFTER 14:30. Must end <= 14:30 (T11). ---
        (too-late-end T12) (too-late-end T13) (too-late-end T14) (too-late-end T15) (too-late-end T16)
        
        ; --- Zachary's Schedule (9:00-11:30 [T0-T4], 12:00-12:30 [T6], 13:00-13:30 [T8], 14:30-15:00 [T11], 16:00-17:00 [T14, T15]) ---
        (busy-Zachary T0) (busy-Zachary T1) (busy-Zachary T2) (busy-Zachary T3) (busy-Zachary T4) 
        (busy-Zachary T6) 
        (busy-Zachary T8) 
        (busy-Zachary T11) 
        (busy-Zachary T14) (busy-Zachary T15)
    )
    (:goal (goal-achieved))
)