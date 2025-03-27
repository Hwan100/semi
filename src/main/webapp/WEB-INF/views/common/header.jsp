<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Document</title>
    <%--    <link rel="stylesheet" href="globals.css"/>--%>
    <%--    <link rel="stylesheet" href="styleguide.css"/>--%>
    <link rel="stylesheet" href="style.css"/>

    <!-- JavaScript -->
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
        }

        .sidebar-container {
            width: 270px;
            height: 1080px;
            background: white;
            overflow: hidden;
            border-right: 0.3px solid rgba(0, 0, 0, 0.5);
            position: relative;
        }

        .sidebar {
            width: 100%;
            height: 100%;
            position: absolute;
            display: flex;
            flex-direction: column;
            gap: 28px;
        }

        .sidebar-logo {
            width: 100%;
            height: 100px;
        }

        .menu-group {
            padding: 10px;
            display: flex;
            flex-direction: column;
            gap: 11px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            gap: 11px;
            padding: 10px;
        }

        .menu-item img {
            width: 40px;
            height: 40px;
        }

        .menu-title {
            font-size: 20px;
            color: #003252;
            font-weight: 400;
        }

        .submenu-container {
            padding: 0 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .submenu-item {
            height: 50px;
            padding: 10px 40px;
            display: flex;
            align-items: center;
            border-radius: 10px;
        }

        .submenu-item.active {
            background-color: rgba(11, 155, 227, 0.4);
            color: white;
        }

        .submenu-text {
            font-size: 16px;
            font-weight: 400;
        }
    </style>
</head>
<body>
<<<<<<< HEAD
<div class="sidebar-container">
    <div class="sidebar">
        <img class="sidebar-logo" src="resources/icons/logo.png" alt="로고">

        <div class="menu-group">
            <div class="menu-item">
                <img src="resources/icons/home.png" alt="대시보드 아이콘">
                <div class="menu-title">대시보드</div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/user_box.png" alt="마이페이지 아이콘">
                <div class="menu-title">마이페이지</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item active">
                    <div class="submenu-text">개인정보 수정</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">수료증 발급</div>
                </div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/calendar.png" alt="출석관리 아이콘">
                <div class="menu-title">출석 관리</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">출석률 조회</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">휴가 관리</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">급여 조회</div>
                </div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/file.png" alt="자소서 아이콘">
                <div class="menu-title">자소서 및 이력서</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">자소서 및 이력서 관리</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">자소서 및 이력서 작성</div>
                </div>
            </div>

            <div class="menu-item">
                <img src="resources/icons/group.png" alt="커뮤니티 아이콘">
                <div class="menu-title">커뮤니티</div>
            </div>
            <div class="submenu-container">
                <div class="submenu-item">
                    <div class="submenu-text">공지사항</div>
                </div>
                <div class="submenu-item">
                    <div class="submenu-text">우리반 게시판</div>
                </div>
            </div>

=======
<div style="width: 270px; height: 1080px; position: relative; background: white; overflow: hidden; border-right: 0.30px rgba(0, 0, 0, 0.50) solid">
    <div style="width: 270px; height: 1080px; left: 0px; top: 0px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 28px; display: inline-flex">
        <img style="align-self: stretch; height: 100px" src="resources/icons/logo.png"  alt=""/>
        <div style="align-self: stretch; padding: 10px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 11px; display: flex">
            <div style="align-self: stretch; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">

                    <img style="align-self: stretch; height: 50px" src="resources/icons/home.png"  alt=""/>


                <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 20px; font-family: Inter; font-weight: 400; word-wrap: break-word">대시보드</div>
            </div>
            <div style="align-self: stretch; padding-left: 10px; padding-right: 10px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                <div style="align-self: stretch; height: 60px; padding-top: 10px; padding-bottom: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="width: 40px; height: 40px; position: relative">
                            <img style="align-self: stretch; height: 30px" src="resources/icons/user_box.png"  alt=""/>
                        </div>
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 20px; font-family: Inter; font-weight: 400; word-wrap: break-word">마이페이지</div>
                    </div>
                    <div style="width: 24px; height: 24px; position: relative">
                        <img style="align-self: stretch; height: 20px" src="resources/icons/expand_left.png"  alt=""/>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding-left: 11px; padding-right: 11px; padding-top: 5px; padding-bottom: 5px; background: rgba(11, 155, 227, 0.40); border-radius: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: white; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">개인정보 수정</div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding-left: 11px; padding-right: 11px; padding-top: 10px; padding-bottom: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">수료증 발급</div>
                    </div>
                </div>
            </div>
            <div style="align-self: stretch; padding-left: 10px; padding-right: 10px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                <div style="align-self: stretch; height: 60px; padding-top: 10px; padding-bottom: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="width: 40px; height: 40px; position: relative">
                            <div style="width: 30px; height: 28.33px; left: 5px; top: 6.67px; position: absolute; outline: 2px black solid; outline-offset: -1px"></div>
                        </div>
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 20px; font-family: Inter; font-weight: 400; word-wrap: break-word">출석 관리</div>
                    </div>
                    <div style="width: 24px; height: 24px; position: relative">
                        <div style="width: 6px; height: 12px; left: 6px; top: 15px; position: absolute; transform: rotate(-90deg); transform-origin: top left; border: 2px #33363F solid"></div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">출석률 조회</div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">휴가 관리</div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">급여 조회</div>
                    </div>
                </div>
            </div>
            <div style="align-self: stretch; padding-left: 10px; padding-right: 10px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                <div style="align-self: stretch; height: 60px; padding-top: 10px; padding-bottom: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="width: 40px; height: 40px; position: relative">
                            <div style="width: 30px; height: 30px; left: 5px; top: 5px; position: absolute; outline: 2px #003252 solid; outline-offset: -1px"></div>
                            <div style="width: 11px; height: 9px; left: 24px; top: 5px; position: absolute; outline: 2px #003252 solid; outline-offset: -1px"></div>
                        </div>
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 20px; font-family: Inter; font-weight: 400; word-wrap: break-word">자소서 및 이력서</div>
                    </div>
                    <div style="width: 24px; height: 24px; position: relative">
                        <div style="width: 6px; height: 12px; left: 6px; top: 15px; position: absolute; transform: rotate(-90deg); transform-origin: top left; border: 2px #33363F solid"></div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">자소서 및 이력서 관리</div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">자소서 및 이력서 작성</div>
                    </div>
                </div>
            </div>
            <div style="align-self: stretch; padding-left: 10px; padding-right: 10px; flex-direction: column; justify-content: flex-start; align-items: flex-start; display: flex">
                <div style="align-self: stretch; height: 60px; padding-top: 10px; padding-bottom: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="width: 40px; height: 40px; position: relative; overflow: hidden">
                            <div style="width: 6.67px; height: 10.83px; left: 21.67px; top: 5.83px; position: absolute; outline: 2px #003252 solid; outline-offset: -1px"></div>
                            <div style="width: 30px; height: 30px; left: 5px; top: 5px; position: absolute; outline: 2px #003252 solid; outline-offset: -1px"></div>
                        </div>
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 20px; font-family: Inter; font-weight: 400; word-wrap: break-word">커뮤니티</div>
                    </div>
                    <div style="width: 24px; height: 24px; position: relative">
                        <div style="width: 6px; height: 12px; left: 6px; top: 15px; position: absolute; transform: rotate(-90deg); transform-origin: top left; border: 2px #33363F solid"></div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">공지사항</div>
                    </div>
                </div>
                <div style="align-self: stretch; height: 50px; padding: 10px; justify-content: flex-start; align-items: center; gap: 11px; display: inline-flex">
                    <div style="flex: 1 1 0; padding-left: 40px; padding-right: 40px; justify-content: flex-start; align-items: center; gap: 11px; display: flex">
                        <div style="justify-content: center; display: flex; flex-direction: column; color: #003252; font-size: 16px; font-family: Inter; font-weight: 400; word-wrap: break-word">우리반 게시판</div>
                    </div>
                </div>
            </div>
>>>>>>> 1117d99 (.)
        </div>
    </div>
</div>
</body>
</html>
=======
>>>>>>> 4e8cc80 (.)
