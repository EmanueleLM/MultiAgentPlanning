(define (problem meet-stephanie-problem)
  (:domain meeting-domain)
  (:objects
    Richmond_District North_Beach - location
  )
  (:init
    (visitor-at Richmond_District)
    (stephanie-at North_Beach)
    (= (time) 540) ; 09:00 arrival at Richmond_District
  )
  (:goal (and
    (met-stephanie)
  ))
  ; Prefer plans that achieve the goal as early as possible
  (:metric minimize (time))
)