<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="WRITE"></c:set>
<%@ include file="../common/head.jspf"%>

<hr />
<!-- 이제부터 내용.. -->

<section class="mt-24 text-xl px-4">
	<div class="mx-auto">
		<form action="../FAQ/doWrite" method="POST">
			<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<tbody>
					<tr>
						<th>질문 내용</th>
						<td style="text-align: center;">
							<input class="input input-bordered input-primary input-sm w-full max-w-xs" name="title" autocomplete="off"
								type="text" placeholder="제목을 입력해주세요." />
						</td>

					</tr>
					<tr>
						<th>답변 내용</th>
						<td style="text-align: center;">
							<input class="input input-bordered input-primary input-sm w-full max-w-xs" name="body" autocomplete="off"
								type="text" placeholder="내용을 입력해주세요." />
						</td>

					</tr>
					<tr>
						<th></th>
						<td style="text-align: center;">
							<button class="btn btn-primary">작성</button>
						</td>

					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn" type="button" onclick="history.back()">뒤로가기</button>
		</div>
	</div>
</section>

<!-- 여기까지 내용 끝.. -->
<%@ include file="../common/foot.jspf"%>