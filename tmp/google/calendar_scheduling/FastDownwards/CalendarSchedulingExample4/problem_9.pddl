(define (problem integrated-meeting-schedule-problem)
  (:domain meeting-scheduling)

  (:objects
    donna john billy - agent
    t9-9.5 t9.5-10 t10-10.5 t10.5-11
    t11-11.5 t11.5-12 t12-12.5 t12.5-13
    t13-13.5 t13.5-14 t14-14.5 t14.5-15
    t15-15.5 t15.5-16 t16-16.5 t16.5-17
    - time-slot
  )

  (:init
    (slot t9-9.5) (slot t9.5-10) (slot t10-10.5) (slot t10.5-11)
    (slot t11-11.5) (slot t11.5-12) (slot t12-12.5) (slot t12.5-13)
    (slot t13-13.5) (slot t13.5-14) (slot t14-14.5) (slot t14.5-15)
    (slot t15-15.5) (slot t15.5-16) (slot t16-16.5) (slot t16.5-17)
    
    (available t10.5-11) (available t11.5-12) (available t12-12.5)
    (available t12.5-13) (available t13-13.5) (available t13.5-14)
    (available t14.5-15) (available t15-15.5) 
    (available t16-16.5) 
    
    (busy donna t14-14.5) (busy donna t15.5-16)
    (busy john t11-11.5) (busy john t16.5-17)
    (busy billy t9-9.5) (busy billy t9.5-10) (busy billy t10-10.5)
    (busy billy t10.5-11) (busy billy t11-11.5) (busy billy t11.5-12)
    (busy billy t12-12.5) (busy billy t12.5-13) (busy billy t13-13.5)
    (busy billy t13.5-14) (busy billy t14-14.5) (busy billy t14.5-15)
    (busy billy t15-15.5) (busy billy t15.5-16) (busy billy t16-16.5)
    (busy billy t16.5-17)
  )

  (:goal
    (exists (?t - time-slot)
      (and (scheduled ?t)
           (not (busy donna ?t))
           (not (busy john ?t))
           (not (busy billy ?t))))
  )
)