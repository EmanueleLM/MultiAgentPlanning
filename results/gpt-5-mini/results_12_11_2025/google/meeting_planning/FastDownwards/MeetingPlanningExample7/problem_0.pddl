(define (problem meet-john-schedule)
  (:domain meet-john)

  (:objects
    richmond-district north-beach - location

    ;; Times used in the chosen schedule (minutes since midnight)
    minute540   ; 09:00
    minute898   ; 14:58 depart
    minute915   ; 15:15 arrive / meeting start
    minute916   minute917 minute918 minute919 minute920
    minute921 minute922 minute923 minute924 minute925
    minute926 minute927 minute928 minute929 minute930
    minute931 minute932 minute933 minute934 minute935
    minute936 minute937 minute938 minute939 minute940
    minute941 minute942 minute943 minute944 minute945
    minute946 minute947 minute948 minute949 minute950
    minute951 minute952 minute953 minute954 minute955
    minute956 minute957 minute958 minute959 minute960 ; last allowed meeting start = 16:00
    minute990   ; 16:30 meeting end
    - time
  )

  (:init
    ;; Initial location at 09:00 (540)
    (at richmond-district minute540)

    ;; Location classification
    (is-north-beach north-beach)

    ;; Travel edges with durations (as provided)
    (travel17 richmond-district north-beach)  ; RD -> NB = 17 minutes
    (travel18 north-beach richmond-district)  ; NB -> RD = 18 minutes

    ;; Precomputed allowed time jumps used by actions (only those needed for the chosen schedule)
    ;; Wait jump: 09:00 (540) -> 14:58 (898)
    (plus minute540 minute898)

    ;; Travel jump for 17-minute leg: 14:58 (898) -> 15:15 (915)
    (plus17 minute898 minute915)

    ;; Meeting duration jump for 75 minutes: 15:15 (915) -> 16:30 (990)
    (plus75 minute915 minute990)

    ;; (We do NOT provide other plus/plus17/plus18/plus75 pairs beyond those needed,
    ;;  so alternative time-jumps/travels that would violate durations are impossible.)

    ;; John's availability: allowed meeting-start times are minutes t where meeting of 75 min fits within John's presence.
    ;; John is at North Beach 15:15 (minute915) through 17:15 (minute1035).
    ;; Therefore allowed meeting starts are minute915 .. minute960 (inclusive), since 915+75=990..960+75=1035.
    (john-available-start minute915)
    (john-available-start minute916)
    (john-available-start minute917)
    (john-available-start minute918)
    (john-available-start minute919)
    (john-available-start minute920)
    (john-available-start minute921)
    (john-available-start minute922)
    (john-available-start minute923)
    (john-available-start minute924)
    (john-available-start minute925)
    (john-available-start minute926)
    (john-available-start minute927)
    (john-available-start minute928)
    (john-available-start minute929)
    (john-available-start minute930)
    (john-available-start minute931)
    (john-available-start minute932)
    (john-available-start minute933)
    (john-available-start minute934)
    (john-available-start minute935)
    (john-available-start minute936)
    (john-available-start minute937)
    (john-available-start minute938)
    (john-available-start minute939)
    (john-available-start minute940)
    (john-available-start minute941)
    (john-available-start minute942)
    (john-available-start minute943)
    (john-available-start minute944)
    (john-available-start minute945)
    (john-available-start minute946)
    (john-available-start minute947)
    (john-available-start minute948)
    (john-available-start minute949)
    (john-available-start minute950)
    (john-available-start minute951)
    (john-available-start minute952)
    (john-available-start minute953)
    (john-available-start minute954)
    (john-available-start minute955)
    (john-available-start minute956)
    (john-available-start minute957)
    (john-available-start minute958)
    (john-available-start minute959)
    (john-available-start minute960)
  )

  ;; Goal: encode the chosen schedule precisely:
  ;; - Meeting with John occurred,
  ;; - Meeting started at 15:15 (minute915) and ended at 16:30 (minute990),
  ;; - Final location at end time (minute990) is North Beach.
  (:goal (and
           (met-john)
           (meeting-start minute915)
           (meeting-end minute990)
           (at north-beach minute990)
         ))
)