(define (problem find-common-1hr-slot)
  (:domain scheduling-meeting)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time-point
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )
  (:init
    ; --- Time Progression (9:00=t0 to 17:00=t16) ---
    (next-time t0 t1) (next-time t1 t2) (next-time t2 t3) (next-time t3 t4) 
    (next-time t4 t5) (next-time t5 t6) (next-time t6 t7) (next-time t7 t8) 
    (next-time t8 t9) (next-time t9 t10) (next-time t10 t11) (next-time t11 t12) 
    (next-time t12 t13) (next-time t13 t14) (next-time t14 t15) (next-time t15 t16)
    
    ; --- Slot Definitions (Slot S_i starts at T_i) ---
    (slot-starts-at s0 t0) (slot-starts-at s1 t1) (slot-starts-at s2 t2) 
    (slot-starts-at s3 t3) (slot-starts-at s4 t4) (slot-starts-at s5 t5) 
    (slot-starts-at s6 t6) (slot-starts-at s7 t7) (slot-starts-at s8 t8) 
    (slot-starts-at s9 t9) (slot-starts-at s10 t10) (slot-starts-at s11 t11) 
    (slot-starts-at s12 t12) (slot-starts-at s13 t13) (slot-starts-at s14 t14) 
    (slot-starts-at s15 t15)

    ; --- Slot Succession ---
    (next-slot s0 s1) (next-slot s1 s2) (next-slot s2 s3) (next-slot s3 s4) 
    (next-slot s4 s5) (next-slot s5 s6) (next-slot s6 s7) (next-slot s7 s8) 
    (next-slot s8 s9) (next-slot s9 s10) (next-slot s10 s11) (next-slot s11 s12) 
    (next-slot s12 s13) (next-slot s13 s14) (next-slot s14 s15)

    ; --- Madison Availability (Busy: S1 (9:30-10:00), S5 (11:30-12:00)) ---
    (slot-available-madison s0) (slot-available-madison s2) 
    (slot-available-madison s3) (slot-available-madison s4) 
    (slot-available-madison s6) (slot-available-madison s7) 
    (slot-available-madison s8) (slot-available-madison s9) 
    (slot-available-madison s10) (slot-available-madison s11) 
    (slot-available-madison s12) (slot-available-madison s13) 
    (slot-available-madison s14) (slot-available-madison s15)
    
    ; --- Diana Availability (Busy: S4 (11:00-11:30), S8 (13:00-13:30)) ---
    (slot-available-diana s0) (slot-available-diana s1) (slot-available-diana s2) 
    (slot-available-diana s3) (slot-available-diana s5) (slot-available-diana s6) 
    (slot-available-diana s7) (slot-available-diana s9) (slot-available-diana s10) 
    (slot-available-diana s11) (slot-available-diana s12) (slot-available-diana s13) 
    (slot-available-diana s14) (slot-available-diana s15)

    ; --- Shirley Availability (Busy slots excluded, only free slots listed) ---
    (slot-available-shirley s6) (slot-available-shirley s7) 
    (slot-available-shirley s8) (slot-available-shirley s12) 
  )
  
  (:goal (meeting-found))
)